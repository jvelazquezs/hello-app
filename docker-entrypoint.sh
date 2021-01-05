#
# This is docker container entry point script. Place here application start up
# instructions to be triggered on deployemnt
#
#!/bin/sh -e

python manage.py migrate
python manage.py runserver 0.0.0.0:8000
