FROM debian:buster

RUN apt update && apt install -y mariadb-server

# create directory for runtime files and set permissions
RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    sed -i 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306

COPY conf/create_db.sh  /tmp/create_db.sh

RUN chmod +x /tmp/create_db.sh

CMD ["bash", "/tmp/create_db.sh"]