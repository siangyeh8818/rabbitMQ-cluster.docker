FROM rabbitmq:3.8.5-management
#FROM rabbitmq:3.5.3-management
MAINTAINER Jia-Siang siangyeh8818@gmail.com

COPY cluster.sh /usr/local/bin/
COPY pre-entrypoint.sh /
COPY add-admin-user.sh  /
COPY rabbitmq.conf /etc/rabbitmq/
EXPOSE 5672 15672 25672 4369 9100 9101 9102 9103 9104 9105
ENTRYPOINT ["/pre-entrypoint.sh"]
CMD ["cluster.sh"]
