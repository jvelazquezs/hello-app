#!/bin/bash

set -e

if [[ $# -ne 4 ]]; then
    echo "USAGE: ./run.sh REGISTRY_IP REGISTRY_USER REGISTRY_PASSWORD SERVER_IP"
    exit 1
fi

$REG_IP=$1
$USER=$2
$PASSWORD=$3
$SERV_IP=$4

docker image build . --tag $REG_IP:5000/django-demo:1.0
echo $PASSWORD | docker login --username $USER --password-stdin
docker image push $REG_IP:5000/django-demo:1.0
ansible-playbook -i 127.0.0.1, playbook.yml

curl http://$SERV_IP:8000/myapp/
