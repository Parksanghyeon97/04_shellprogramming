#!/bin/bash
#   httpd webserver setting
#   (1) pacakge install( yum -y install nginx )
#   (2) server setting ( echo "<h1>httpd WebServer</h1>" > /usr/share/nginx/html/index.html)
#   (3) service start ( systemctl enable --now nginx.service )


yum -y install nginx \
    && echo "<h1>nginx WebServer</h1>" > /usr/share/nginx/html/index.html \
    && service nginx restart \
    && echo "[  OK  ] Apache nginx Web Server started"
