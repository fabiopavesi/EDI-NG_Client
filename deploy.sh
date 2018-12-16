#!/usr/bin/env bash

# ng build --prod --build-optimizer --base-href '/edi/' && \
# scp -C -r dist/* root@enygma.it:/var/www/sdi/edi/

ng build --prod --build-optimizer &&
docker build -t edi-client .
docker stop edi-client
docker rm edi-client
docker run --name edi-client -v $(pwd)/template_backup/:/usr/share/nginx/html/assets/templates/ -d -p 80:80 edi-client