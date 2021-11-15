#!/bin/bash

#DB_SERVER_HOST="mssql-$CI_DEPLOYMENT_ENV_NAME"
APP_SECRETS_NAME="dotnetcore-app-secrets"

cat > deployment-env.yml <<EOL
---
apiVersion: v1
kind: Secret
metadata:
  name: $APP_SECRETS_NAME
type: Opaque
stringData:
  DB_CONNECTION: "mssql"
  DB_HOST: "$DB_SERVER_HOST"
  DB_PORT: "$DB_SERVER_PORT"
  DB_DATABASE: "$DB_SERVER_DATABASE"
  DB_USERNAME: "$DB_SERVER_USER"
  DB_PASSWORD: "$DB_SERVER_PASSWD"
  ASPNETCORE_ENVIRONMENT: "$CI_DEPLOYMENT_ENV_NAME"
  ASPNETCORE_URLS: "https://+;http://+"
  LettuceEncrypt__PersistDataDirectory: "/app/gce-persistent-disk/LettuceEncrypt/"
  UseLettuceEncryptSSL: "$CI_UseLettuceEncryptSSL"
  JWT__ValidAudience: "lms.dh-labs.com"
  JWT__ValidIssuer: "test-hub.elschoola.com"
EOL
