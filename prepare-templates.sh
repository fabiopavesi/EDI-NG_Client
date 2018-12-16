#!/usr/bin/env sh

if [ -z "$(ls -A /usr/share/nginx/html/assets/templates)" ]; then
    cp -R /templates/* /usr/share/nginx/html/assets/templates/
fi

exec nginx -g 'daemon off;'