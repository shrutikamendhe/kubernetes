#!/usr/bin/env bash

SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )
K8S_HOME=$(dirname "${SCRIPTPATH}")

source "${K8S_HOME}/script/common.sh"

if [ "${HOST_ROLE}" == "master" ] && [ -d "/data/kubernetes/manifests/" ]
then
process_manifests
process_addons
fi
docker_login