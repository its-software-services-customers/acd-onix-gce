#!/bin/bash

VERSION=v0.0.8
REPO_NAME=acd-onix-gce
BRANCH=develop
VAULT_BUCKET=acd-dev-vault

sudo docker run \
-v $(pwd)/${REPO_NAME}:/wip/output \
-v ${HOME}/.ssh/:/root/.ssh/ \
-e IASC_VCS_MODE=git \
-e IASC_VCS_URL="https://github.com/its-software-services-customers/${REPO_NAME}.git" \
-e IASC_VCS_REF=${BRANCH} \
-e IASC_VAULT_SECRETS=gs://${VAULT_BUCKET}/onix/secrets.txt \
-it gcr.io/its-artifact-commons/iasc:${VERSION} \
init

sudo chown -R $(whoami):$(whoami) ${REPO_NAME}