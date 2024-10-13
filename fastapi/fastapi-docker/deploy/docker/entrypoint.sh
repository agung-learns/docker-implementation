#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset

postgres_ready() {
python << END
import sys

import psycopg
import urllib.parse as urlparse
import os

url = urlparse.urlparse(os.environ['DATABASE_URL'])
dbname = url.path[1:]
user = url.username
password = url.password
host = url.hostname
port = url.port

try:
    psycopg.connect(
        dbname=dbname,
        user=user,
        password=password,
        host=host,
        port=port
    )
except psycopg.OperationalError:
    sys.exit(-1)
sys.exit(0)

END
}
until postgres_ready; do
  >&2 echo 'Waiting for PostgreSQL to become available...'
  sleep 1
done
>&2 echo 'PostgreSQL is available'


vector_ready() {
python << END
import sys

import psycopg
import urllib.parse as urlparse
import os

url = urlparse.urlparse(os.environ['VECTOR_URL'])
dbname = url.path[1:]
user = url.username
password = url.password
host = url.hostname
port = url.port

try:
    psycopg.connect(
        dbname=dbname,
        user=user,
        password=password,
        host=host,
        port=port
    )
except psycopg.OperationalError:
    sys.exit(-1)
sys.exit(0)

END
}
until vector_ready; do
  >&2 echo 'Waiting for Vector to become available...'
  sleep 1
done
>&2 echo 'Vector is available'

exec "$@"