#!/bin/bash
docker build \
    --cache-from "$PARAM_IMAGE":"$CIRCLE_SHA1" \
    --tag "$PARAM_IMAGE":"$CIRCLE_SHA1" \
    --build-arg BUILDKIT_INLINE_CACHE=1 \
    .