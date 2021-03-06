#!/usr/bin/env bash

apt-get update

apt-get install -y ebtables socat jq apt-transport-https bash-completion ntp wget

apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'

apt-get update

apt-cache policy docker-engine
apt-get install -y docker-engine

apt-get remove network-manager

DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade


