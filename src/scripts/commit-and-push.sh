#!/bin/bash

cd apps || exit
git add .
git commit -m "${PARAM_APP}: Deploy ${PARAM_SERVICE} service on the ${CIRCLE_BRANCH} environment"
git push -u origin main