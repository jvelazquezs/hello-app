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
RESPOSE_CODE="000"
START_TIME="$(date +%s)"
ELAPSED_TIME=0

while [ "$RESPONSE_CODE" != "200" ]; do
    echo "Starting App Stack ... $ELAPSED_TIME"
    RESPONSE_CODE=$(python test_connection.py $SERV_IP)
    sleep 10
    ELAPSED_TIME=$[ $(date +%s) - $START_TIME ]

    if [ $ELAPSED_TIME -ge 120 ]; then
        echo "App Stack is taking more than 120s ..." >&2
        exit 1
    fi 
done

curl http://$SERV_IP:8000/myapp/
