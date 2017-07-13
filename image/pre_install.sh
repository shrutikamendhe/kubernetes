#!/usr/bin/env bash

apt-get install -y git wget jq apt-transport-https

cd /tmp
wget https://pek3a.qingstor.com/appcenter/developer/packages/app-agent-linux-amd64.tar.gz
tar -zxvf app-agent-linux-amd64.tar.gz
cd app-agent-linux-amd64/
./install.sh

chmod +x /etc/init.d/confd

cd /tmp
rm -rf app-agent-linux-amd64/
rm app-agent-linux-amd64.tar.gz

apt-get remove network-manager


cat << EOF > /etc/sysctl.conf
net.ipv4.ip_forward = 1
vm.swappiness = 1
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
net.ipv4.conf.all.rp_filter = 2
vm.max_map_count=262144
fs.file-max=200000
fs.inotify.max_user_watches=1048576
EOF

sysctl -p