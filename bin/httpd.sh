#!/bin/bash
#   httpd webserver setting
#   (1) pacakge install( yum -y install httpd )
#   (2) server setting ( echo "<h1>httpd WebServer</h1>" > /var/www/html/index.html)
#   (3) service start ( systemctl enable --now httpd )


yum -y install httpd \
    && echo "<h1>httpd WebServer</h1>" > /var/www/html/index.html \
    && service httpd restart \
    && echo "[  OK  ] Apache HTTPD Web Server started"
