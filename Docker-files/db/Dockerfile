FROM mysql:8.0

LABEL project="vprofile"
LABEL maintainer="Emeka Umejiofor"
LABEL description="MySQL database for vprofile project"
LABEL Author="Emeka Umejiofor"

ENV MySQL_ROOT_PASSWORD="vprodbpass"
ENV MySQL_DATABASE="accounts"

ADD db_backup.sql docker-entrypoint-initdb.d/db_backup.sql

# Expose the MySQL port
EXPOSE 3306
