#!/bin/sh

python manage.py migrate --noinput

if [ -f "/app/data/Relatorio_cadop.csv" ]; then
  python manage.py import_operadoras /app/data/Relatorio_cadop.csv
fi

exec gunicorn --bind 0.0.0.0:8000 --workers 3 config.wsgi:application
