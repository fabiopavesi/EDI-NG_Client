FROM nginx:alpine
MAINTAINER Fabio Pavesi - fabio@adamassoft.it
COPY ./dist /usr/share/nginx/html
COPY ./dist/assets/templates /templates
COPY ./nginx-custom.conf /etc/nginx/conf.d/default.conf
COPY prepare-templates.sh /app/
VOLUME /usr/share/nginx/html/assets/templates
EXPOSE 80
CMD ["/app/prepare-templates.sh"]