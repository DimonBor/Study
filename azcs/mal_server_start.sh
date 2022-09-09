#!/usr/bin/sh
nginx -c mal_server.conf -g "pid /var/run/nginx_v.pid;"
