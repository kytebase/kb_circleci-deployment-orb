#!/bin/bash

DEPLOY_ENV=$(echo "$CIRCLE_BRANCH" | grep -oEi '^([a-z]{3,4})')
ROOT_DIR=$(pwd)

for app in $PARAM_APP; do
    K8S_DIR="$ROOT_DIR/apps/$app/environments/$DEPLOY_ENV/k8s"

    if [ ! -d "$K8S_DIR" ] 
    then
        echo "Updating: $app"
        cd $K8S_DIR || exit
        /home/circleci/project/kustomize edit set image "$PARAM_IMAGE"="$PARAM_IMAGE":"$CIRCLE_SHA1"
    else
        echo "Skipped: $app"
        echo "$K8S_DIR directory does not exist."
    fi
done