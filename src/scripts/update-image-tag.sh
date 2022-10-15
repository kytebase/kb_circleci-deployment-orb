#!/bin/bash

DEPLOY_ENV=$(echo "$CIRCLE_BRANCH" | grep -oEi '^([a-z]{3,4})')

for app in $PARAM_APP; do
    echo "Updating: $app"
    cd "apps/$app/environments/$DEPLOY_ENV/k8s" || exit
    /home/circleci/project/kustomize edit set image "$PARAM_IMAGE"="$PARAM_IMAGE":"$CIRCLE_SHA1"
done