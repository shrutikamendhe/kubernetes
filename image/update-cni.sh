#!/usr/bin/env bash

SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )
K8S_HOME=$(dirname "${SCRIPTPATH}")

source ${K8S_HOME}/version

CNI_VERSION=v0.5.2
HOSTNIC_VERSION=v0.8.4

pushd /tmp
wget -c https://pek3a.qingstor.com/k8s-qingcloud/k8s/tool/cni-amd64-${CNI_VERSION}.tgz
mkdir -p /opt/cni/bin
tar -zxvf cni-amd64-${CNI_VERSION}.tgz -C /opt/cni/bin
rm cni-amd64-${CNI_VERSION}.tgz

wget -c https://pek3a.qingstor.com/k8s-qingcloud/k8s/tool/hostnic/${HOSTNIC_VERSION}/hostnic.tar.gz
tar -zxvf hostnic.tar.gz -C /opt/cni/bin
rm hostnic.tar.gz

popd
