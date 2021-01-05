#!/bin/bash

docker image build . --tag 127.0.0.1:5000/django-demo:1.0
docker image push 127.0.0.1:5000/django-demo:1.0
ansible-playbook -i 127.0.0.1, playbook.yml

curl http://172.42.0.60:8000/myapp/
