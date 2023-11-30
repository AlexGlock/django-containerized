#!/bin/bash

# start cups client
service cups-browsed start

# init db and media
python3 ./manage.py migrate --noinput 

# collect staticfiles
python3 ./manage.py collectstatic --no-input

# launch webapp with gunicorn
gunicorn django_podman.wsgi:application -w 2 -b :8000 