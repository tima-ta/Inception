FROM debian:oldstable

ARG DBname
ARG DBuser
ARG DBpasswd
ARG DBRootpasswd

RUN apt-get update ; \
    apt-get install -y mariadb-server gettext

COPY tools/init.sql.template /etc/mysql/init.sql.template

RUN envsubst < /etc/mysql/init.sql.template > /etc/mysql/init.sql

WORKDIR /etc/mysql/mariadb.conf.d/

RUN sed -i -e 's/127.0.0.1/0.0.0.0/' \
        -e 's/user                    = mysql/user = root/' \
        -e '28i port = 3306' \
        -e '14i init_file = /etc/mysql/init.sql' 50-server.cnf

RUN mkdir -p /run/mysqld

ENTRYPOINT [ "mysqld" ]