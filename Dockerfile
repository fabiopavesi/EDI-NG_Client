#FROM node:10-alpine as node
#
#WORKDIR /app
#COPY . .
#
#RUN apk add --update \
#    python \
#    python-dev \
#    py-pip \
#    build-base \
#  && pip install virtualenv \
#  && rm -rf /var/cache/apk/* && \
#    rm -rf node_modules && \
#    npm install node-sass@latest && \
#    npm install -g @angular/cli && \
#    npm install && \
#    ng build --prod

FROM nginx:alpine
MAINTAINER Fabio Pavesi - fabio@adamassoft.it

# COPY --from=node /app/dist /usr/share/nginx/html

COPY ./dist /usr/share/nginx/html
COPY ./dist/assets/templates /templates
COPY ./nginx-custom.conf /etc/nginx/conf.d/default.conf
COPY prepare-templates.sh /app/
VOLUME /usr/share/nginx/html/assets/templates

EXPOSE 80

CMD ["/app/prepare-templates.sh"]
