#!/bin/bash

DEPLOY_ENV=$(echo "$CIRCLE_BRANCH" | grep -oEi '^([a-z]{3,4})')

cd "apps/$PARAM_APP/environments/$DEPLOY_ENV/k8s" || exit
/home/circleci/project/kustomize edit set image "$PARAM_IMAGE"="$PARAM_IMAGE":"$CIRCLE_SHA1"