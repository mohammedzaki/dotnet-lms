#!/bin/bash

APP_NAME="digitalhublms-$CI_DEPLOYMENT_ENV_NAME"
APP_WEB_NAME="digitalhublms-web-$CI_DEPLOYMENT_ENV_NAME"
APP_MIG_NAME="digitalhublms-mig-$CI_DEPLOYMENT_ENV_NAME"
APP_API_NAME="digitalhublms-api-$CI_DEPLOYMENT_ENV_NAME"
APP_DISK_PV_NAME="$APP_NAME-pv-claim"

APP_DB_NAME="mssql-$CI_DEPLOYMENT_ENV_NAME"
APP_DB_STORAGE_NAME="mssql-persistent-storage"
APP_DB_STORAGE_PATH="/var/opt/mssql"
APP_DB_DISK_PV_NAME="$APP_DB_NAME-pv-claim"
APP_DB_IMAGE="mcr.microsoft.com/mssql/server:2017-latest"
APP_DB_PORT="1433"

APP_VOLUME_NAME="dotnetcore-app-volume"
APP_SECRETS_NAME="dotnetcore-app-secrets"

cat > deployment.yml <<EOL
---
  apiVersion: storage.k8s.io/v1
  kind: StorageClass
  metadata:
    name: fast
    labels:
      app: $APP_NAME
  provisioner: kubernetes.io/gce-pd
  parameters:
    type: pd-ssd
---
  apiVersion: v1
  kind: Service
  metadata:
    name: $APP_DB_NAME
    labels:
      app: $APP_DB_NAME
  spec:
    type: LoadBalancer
    selector:
      app: $APP_DB_NAME
      tier: dbserver
    ports:
    - name: $APP_DB_NAME
      port: $APP_DB_PORT
      protocol: TCP
      targetPort: $APP_DB_PORT
---
  apiVersion: v1
  kind: PersistentVolumeClaim
  metadata:
    name: $APP_DB_DISK_PV_NAME
    labels:
      app: $APP_NAME
  spec:
    storageClassName: fast
    accessModes:
      - ReadWriteOnce
    resources:
      requests:
        storage: 5Gi
---
  apiVersion: apps/v1
  kind: Deployment
  metadata:
     name: $APP_DB_NAME
     labels:
       app: $APP_DB_NAME
  spec:
    selector:
      matchLabels:
        app: $APP_DB_NAME
        tier: dbserver
    strategy:
      type: Recreate
    template:
      metadata:
        labels:
          app: $APP_DB_NAME
          tier: dbserver
      spec:
        containers:
        - name: $APP_DB_NAME
          image: $APP_DB_IMAGE
          ports:
          - containerPort: $APP_DB_PORT
          env:
          - name: MSSQL_PID
            value: "Developer"
          - name: ACCEPT_EULA
            value: "Y"
          - name: SA_PASSWORD
            valueFrom:
              secretKeyRef:
                name: $APP_SECRETS_NAME
                key: DB_PASSWORD
            name: $APP_DB_NAME
          volumeMounts:
          - name: $APP_DB_STORAGE_NAME
            mountPath: $APP_DB_STORAGE_PATH
        volumes:
        - name: $APP_DB_STORAGE_NAME
          persistentVolumeClaim:
            claimName: $APP_DB_DISK_PV_NAME
---
  apiVersion: apps/v1
  kind: Deployment
  metadata:
    name: $APP_MIG_NAME
    labels:
      app: $APP_MIG_NAME
  spec:
    replicas: 1
    selector:
      matchLabels:
        app: $APP_MIG_NAME
        tier: backend
    strategy:
      type: Recreate
    template:
      metadata:
        labels:
          app: $APP_MIG_NAME
          tier: backend
      spec:
        containers:
        - name: $APP_MIG_NAME
          image: $CI_BUILD_MIG_IMAGE_VERSION
          imagePullPolicy: Always
          ports:
          - containerPort: 80
          - containerPort: 443
          envFrom:
          - secretRef:
              name: $APP_SECRETS_NAME
        imagePullSecrets:
          - name: registry.gitlab.com
---
  apiVersion: v1
  kind: Service
  metadata:
    name: $APP_WEB_NAME
    labels:
      app: $APP_WEB_NAME
  spec:
    selector:
      app: $APP_WEB_NAME
      tier: backend
    ports:
    - name: http
      port: 80
      protocol: TCP
      targetPort: 80
    - name: https
      port: 443
      protocol: TCP
      targetPort: 443
    type: LoadBalancer
---
  apiVersion: v1
  kind: PersistentVolumeClaim
  metadata:
    name: $APP_DISK_PV_NAME
    labels:
      app: $APP_NAME
  spec:
    storageClassName: fast
    accessModes:
      - ReadWriteOnce
    resources:
      requests:
        storage: 5Gi
---
  apiVersion: apps/v1
  kind: Deployment
  metadata:
    name: $APP_WEB_NAME
    labels:
      app: $APP_WEB_NAME
  spec:
    replicas: 1
    selector:
      matchLabels:
        app: $APP_WEB_NAME
        tier: backend
    strategy:
      type: Recreate
    template:
      metadata:
        labels:
          app: $APP_WEB_NAME
          tier: backend
      spec:
        volumes:
          - name: $APP_VOLUME_NAME
            persistentVolumeClaim:
              claimName: $APP_DISK_PV_NAME
        containers:
        - name: $APP_WEB_NAME
          image: $CI_BUILD_WEB_IMAGE_VERSION
          imagePullPolicy: Always
          ports:
          - containerPort: 80
          - containerPort: 443
          envFrom:
          - secretRef:
              name: $APP_SECRETS_NAME
          volumeMounts:
            - name: $APP_VOLUME_NAME
              mountPath: /app/gce-persistent-disk
        imagePullSecrets:
          - name: registry.gitlab.com
---
  apiVersion: v1
  kind: Service
  metadata:
    name: $APP_API_NAME
    labels:
      app: $APP_API_NAME
  spec:
    selector:
      app: $APP_API_NAME
      tier: backend
    ports:
    - name: http
      port: 80
      protocol: TCP
      targetPort: 80
    - name: https
      port: 443
      protocol: TCP
      targetPort: 443
    type: LoadBalancer
---
  apiVersion: apps/v1
  kind: Deployment
  metadata:
    name: $APP_API_NAME
    labels:
      app: $APP_API_NAME
  spec:
    replicas: 1
    selector:
      matchLabels:
        app: $APP_API_NAME
        tier: backend
    strategy:
      type: Recreate
    template:
      metadata:
        labels:
          app: $APP_API_NAME
          tier: backend
      spec:
        volumes:
          - name: $APP_VOLUME_NAME
            persistentVolumeClaim:
              claimName: $APP_DISK_PV_NAME
        containers:
        - name: $APP_API_NAME
          image: $CI_BUILD_API_IMAGE_VERSION
          imagePullPolicy: Always
          ports:
          - containerPort: 80
          - containerPort: 443
          envFrom:
          - secretRef:
              name: $APP_SECRETS_NAME
          volumeMounts:
            - name: $APP_VOLUME_NAME
              mountPath: /app/gce-persistent-disk
        imagePullSecrets:
          - name: registry.gitlab.com
EOL
