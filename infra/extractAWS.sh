#!/usr/bin/env bash

set -o noclobber  # Avoid overlay files (echo "hi" > foo)
set -o errexit    # Used to exit upon error, avoiding cascading errors
set -o pipefail   # Unveils hidden failures
# set -o nounset    # Exposes unset variables

EXPORT_DIR=${PWD}/generated

if [[ -d ${EXPORT_DIR} ]]; then
    echo "Output existing...deleting! Byebye"
    rm -rf ${EXPORT_DIR}
fi

# Init
terraform init

# Perform extraction to HCL from AWS Source
# terraformer import aws --resources=elastic_beanstalk,iam \
#     --regions=us-east-2

terraformer import aws --resources=elastic_beanstalk,iam \
    --regions=us-east-2 \
    --filter="Name=tags.project;Value='zartan'"
