FROM mysql

ENV MYSQL_ROOT_PASSWORD root

RUN set -ex \
 echo -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'IDENTIFIED BY 'root' WITH GRANT OPTION;\nFLUSH PRIVILEGES" > /docker-entrypoint-initdb.d/open_remote_privilege.sql &&\
 echo -e "bulk_insert_buffer_size=120M\nmax_allowed_packet=512M\nnet_buffer_length=16K" >>/etc/mysql/conf.d/docker.cnf


ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3306
CMD ["mysqld"]
