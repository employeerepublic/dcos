#!/bin/bash
set -o errexit -o nounset -o pipefail

# AWS profile with appropriate credentials for Packer to create the AMI
export AWS_PROFILE=${AWS_PROFILE:-"root"}

# Base CentOS 7 AMI and region
export SOURCE_AMI=${SOURCE_AMI:-"ami-785cfc01"}
export SOURCE_AMI_REGION=${SOURCE_AMI_REGION:-"eu-west-1"}
# Version upgraded to in install_prereqs.sh
export CENTOS_VERSION=${CENTOS_VERSION:-"7.4.1708"}
# Comma separated string of AWS regions to copy the resulting DC/OS AMI to
export DEPLOY_REGIONS=${DEPLOY_REGIONS:-"eu-west-1"}

# Useful options include -debug and -machine-readable
PACKER_BUILD_OPTIONS=${PACKER_BUILD_OPTIONS:-""}

packer build $PACKER_BUILD_OPTIONS packer.json
