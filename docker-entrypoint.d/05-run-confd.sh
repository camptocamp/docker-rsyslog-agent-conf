#!/bin/sh -e

mkdir -p /etc/rsyslog-confd

while true; do
  sleep 1
  confd --backend rancher --prefix /2016-07-29 --onetime && break
done
