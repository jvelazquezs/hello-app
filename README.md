# hello-app

Simple Python Django application

## Project

This repository contains a simple Python Django application placed in `myapp` and `polls` folders, and `manage.py` file. In order to run a project you need backend and frontend together.

### Backend

It is a docker image of a relational database. We suggest to take official image `postgres:10.6` docker image https://hub.docker.com/_/postgres

This containerized database can be configured by the following environment variables:

| Variable             | Description                 | Example    |
|:-------------------: |:---------------------------:|:----------:|
| POSTGRES_PASSWORD    | password for DB connection  |%R$#D$#TR   |
| POSTGRES_DB          | datbase name                | demo       |


### Frontend

This is containerized Python Django application from the current repository. Client connections are listened on `tcp 8000` port. Connection to a database configured via environment variables, similar to `backend` container.

| Variable         | Description              | Example  |
|:----------------:|:------------------------:|:--------:|
| DB_HOST          | database hostname        | db       |
| DB_USER          | datbase user             | postgres |
| DB_PASSWORD      | database password        | %R$#D$#TR|
| DB_NAME          | database name            | demo     |


### Your task

1. Create `Dockerfile` to dockerize Python Django application from this repository
2. Complete `docker-compose.yaml` to run all parts of the project: `backend` and `frontend` containers, configuring them via environment variables.
3. Create Ansible playbook in the same project to locally
- setup Docker Swarm
- setup Docker Compose
- setup Docker Registry container to Docker Swarm
4. Create bash script in the same project to
- build Docker image
- push Docker image to registry
- run Ansible playbook to deploy application to Docker Swarm
NOTE: Don't need to contribute too much to this script to any runnable one to be able to test the solution

### Verify the task

1. Clone project to clean Redhat, CentOS or ORacle Linux
2. Run bash script
3. Check request:
```
curl http://{docker_host_ip}:8000/myapp
```

Expected reply:
```
Hello, world \(@_@)/. You're at the polls index
```