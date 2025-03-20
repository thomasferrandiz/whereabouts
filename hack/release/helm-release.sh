#!/bin/bash
set -ex

helm package ./deployment/chart/whereabouts --destination chart/ --version ${GITHUB_TAG} --app-version ${GITHUB_TAG}
mv chart/whereabouts-${GITHUB_TAG}.tgz chart/whereabouts.tgz

# wget https://${GITHUB_REPO_OWNER}.github.io/whereabouts/index.yaml -O chart/index.yaml || true
# helm repo index --merge chart/index.yaml --url https://github.com/${GITHUB_REPO_OWNER}/whereabouts/releases/download/${GITHUB_TAG}/ chart/
helm repo index --url https://github.com/${GITHUB_REPO_OWNER}/whereabouts/releases/download/${GITHUB_TAG}/ chart/

