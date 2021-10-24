#!/bin/bash

DB_SERVER_HOST="mssql-$CI_DEPLOYMENT_ENV_NAME"

cat > deployment-env.yml <<EOL
---
apiVersion: v1
kind: Secret
metadata:
  name: dotnetcore-app-secrets
type: Opaque
stringData:
  DB_CONNECTION: "mssql"
  DB_HOST: "$DB_SERVER_HOST"
  DB_PORT: "$DB_SERVER_PORT"
  DB_DATABASE: "$DB_SERVER_DATABASE"
  DB_USERNAME: "$DB_SERVER_USER"
  DB_PASSWORD: "$DB_SERVER_PASSWD"
  ASPNETCORE_ENVIRONMENT: "$CI_DEPLOYMENT_ENV_NAME"
  ConnectionStrings__DefaultConnection: "Server=$DB_SERVER_HOST,$DB_SERVER_PORT;Database=$DB_SERVER_DATABASE;User Id=$DB_SERVER_USER;Password=$DB_SERVER_PASSWD;"
  ASPNETCORE_URLS: "https://+;http://+"
  LettuceEncrypt__PersistDataDirectory: "/app/gce-persistent-disk/LettuceEncrypt/"
EOL
