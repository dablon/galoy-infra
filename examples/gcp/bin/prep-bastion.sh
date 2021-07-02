#!/bin/bash

set -eu

REPO_ROOT=$(git rev-parse --show-toplevel)
REMOTE_FOLDER="${REMOTE_FOLDER:-${REPO_ROOT##*/}}"

pushd bootstrap

tf_state_bucket_name=$(terraform output tf_state_bucket_name | jq -r)
name_prefix=$(terraform output name_prefix | jq -r)

popd

pushd inception

bastion_ip="$(terraform output bastion_ip | jq -r)"

popd

pushd platform

cat <<EOF > terraform.tf
terraform {
  backend "gcs" {
    bucket = "${tf_state_bucket_name}"
    prefix = "${name_prefix}/platform"
  }
}
EOF

popd

rsync -avr -e "ssh -l ${BASTION_USER} -o StrictHostKeyChecking=no" ${REPO_ROOT} ${bastion_ip}:${REMOTE_FOLDER}
