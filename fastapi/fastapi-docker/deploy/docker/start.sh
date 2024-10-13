#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset

alembic upgrade head
uvicorn cmd.cmd:app --reload --reload-dir api --host 0.0.0.0 --port 8000