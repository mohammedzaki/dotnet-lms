#!/usr/bin/env bash

echo "run deploy on $CI_DEPLOYMENT_ENV_NAME env for image $CI_BUILD_IMAGE_VERSION"
echo "$GOOGLE_KEY" > google.key.json
gcloud auth activate-service-account --key-file google.key.json
gcloud config set container/use_client_certificate False
gcloud container clusters get-credentials $GOOGLE_CLUSTER_NAME --zone us-central1-c --project $GOOGLE_PROJECT_NAME
kubectl apply -f namespaces-deployment.yml
./build-deployment-file.sh
./build-deployment-env-file.sh
echo "$REGISTRY_SECRET" > registry-gitlab-secret.yml
kubectl apply -f registry-gitlab-secret.yml --namespace=$CI_DEPLOYMENT_NAMESPACE
kubectl apply -f deployment-env.yml --namespace=$CI_DEPLOYMENT_NAMESPACE
kubectl apply -f deployment.yml --namespace=$CI_DEPLOYMENT_NAMESPACE