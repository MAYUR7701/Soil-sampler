#!/bin/bash

# # Wait for MariaDB service to become available
# until mysqladmin ping -h mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" &> /dev/null; do
#     >&2 echo "MariaDB is unavailable - sleeping"
#     sleep 1
# done

# >&2 echo "MariaDB is up - continuing"

# Apply Django migrations
python manage.py migrate

# Start Django server with Gunicorn
exec gunicorn backend.wsgi:application --bind 0.0.0.0:8000
