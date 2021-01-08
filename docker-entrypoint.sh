#
# This is docker container entry point script. Place here application start up
# instructions to be triggered on deployemnt
#
#!/bin/sh -e

until PGPASSWORD=$DB_PASSWORD psql -h "$DB_HOST" -U "$DB_USER" -d "$DB_NAME" -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done
  
>&2 echo "Postgres is up - executing command"

python manage.py migrate
python manage.py runserver 0.0.0.0:8000
