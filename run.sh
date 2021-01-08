#!/bin/bash

set -e

if [[ $# -ne 1 ]]; then
    echo "USAGE: ./run.sh SERVER_IP"
    exit 1
fi

if ! groups $USER | grep -e root -e wheel -q; then
    echo "User $USER not allowed to run yum or become root in ansible playbook"
    exit 1
fi

SERV_IP=$1

sudo yum install -y epel-release
sudo yum install -y ansible
ansible-playbook -i 127.0.0.1, playbook.yml -e address=$SERV_IP

# The frontend container takes a while to start as it waits for a successful Postgres connection
sleep 10
curl http://$SERV_IP:8000/myapp/
