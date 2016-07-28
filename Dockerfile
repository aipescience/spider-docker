FROM mariadb:10.1
MAINTAINER "Jochen Klar" <jklar@aip.de>

COPY server.cnf /etc/my.cnf.d/server.cnf

COPY install_federatedx.sql /docker-entrypoint-initdb.d/
COPY install_sys_mariadb_10.sql /docker-entrypoint-initdb.d/
RUN cp /usr/share/mysql/install_spider.sql /docker-entrypoint-initdb.d/
