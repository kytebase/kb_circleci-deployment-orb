#!/bin/bash
cd "apps/$PARAM_APP/environments/$CIRCLE_BRANCH/k8s"
/home/circleci/project/kustomize edit set image "$PARAM_IMAGE"="$PARAM_IMAGE":"$CIRCLE_SHA1"