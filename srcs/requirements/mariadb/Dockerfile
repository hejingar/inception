FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y
# RUN apt-get install vim -y
RUN apt-get install mariadb-server -y
RUN apt-get install mariadb-client -y
RUN apt-get install procps -y

COPY ./conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf


RUN mkdir -p /var/run/mysqld
RUN mkdir -p /var/lib/mysql
RUN chown mysql:mysql /var/run/mysqld/
RUN chmod -R 755 /var/run/mysqld/
RUN chown mysql:mysql /var/lib/mysql/
RUN chmod -R 755 /var/lib/mysql/


EXPOSE 3306

COPY ./tools/configuresql.sh /usr/local/bin/
# COPY ./conf/wordpress.sql /usr/local/bin/

RUN chmod +x /usr/local/bin/configuresql.sh
# RUN chmod +x /usr/local/bin/wordpress.sql

ENTRYPOINT ["bash", "/usr/local/bin/configuresql.sh" ]

# CMD ["mysqld", "--bind-address=0.0.0.0"]