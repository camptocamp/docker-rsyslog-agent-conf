FROM camptocamp/rsyslog-bin:v0.1.7

ADD ./conf.d /etc/confd/conf.d
ADD ./templates /etc/confd/templates

COPY /docker-entrypoint.d/* /docker-entrypoint.d/
