#!/bin/sh


envsubst < auth.conf > /etc/nginx/conf.d/auth.conf
envsubst < auth.htpasswd > /etc/nginx/auth.htpasswd

htpasswd -c -b /etc/nginx/auth.htpasswd $USER $PASS

echo "Starting Nginx proxy with auth $USER:$PASS"

echo basic-auth-pwd
cat /etc/nginx/auth.htpasswd

rm /etc/nginx/conf.d/default.conf

nginx -g "daemon off;"