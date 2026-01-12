#!/bin/sh
set -e

echo "--- STARTING ENTRYPOINT ---"

if [ ! -d "migrations" ]; then
    echo "Initializing migrations folder..."
    flask db init || true
fi

echo "Generating migration script..."
flask db migrate -m "Auto-migration" || true

echo "Applying database upgrades..."
flask db upgrade || true

echo "Checking/Creating Super Admin..."
flask create-superadmin

echo "--- STARTING SERVER ON PORT 80 ---"
exec gunicorn -w 4 -b 0.0.0.0:80 app:app