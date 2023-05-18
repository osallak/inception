FROM debian:stable

ARG DB_NAME\
    DB_USER\
    DB_PASS

RUN apt update && apt install -y mariadb-server mariadb-client

# create directory for runtime files and set permissions
RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    echo -e "[mysqld]\nbind-address=0.0.0.0" >> /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306

COPY tools/create_db.sh  /tmp/create_db.sh

RUN sh /tmp/create_db.sh

USER mysql

CMD [ "/usr/bin/mysql" , "--skip-log-error"]