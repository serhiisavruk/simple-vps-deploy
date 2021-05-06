FROM nginx:latest

RUN apt-get update

RUN rm /etc/nginx/conf.d/default.conf
COPY ./docker/nginx/conf/site.conf /etc/nginx/conf.d/

COPY . /var/www/html

EXPOSE 8000