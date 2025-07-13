#!/bin/bash
set -e

docker-entrypoint.sh mysqld &

until mysqladmin ping -h localhost --silent; do
    echo "Waiting for database to be ready..."
    sleep 2
done

if ! mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e 'USE accounts;' 2>/dev/null; then
    echo "Database 'accounts' not found, importing SQL..."
    mysql -uroot -p"$MYSQL_ROOT_PASSWORD" < /docker-entrypoint-initdb.d/db_backup.sql
else
    echo "Database 'accounts' already exists, skipping import."
fi

wait
