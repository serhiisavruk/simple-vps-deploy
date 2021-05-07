LOCAL = local
PRODUCTION = production

PHP_CONTAINER_NAME = php
NGINX_CONTAINER_NAME = nginx

ENVIRONMENT ?= local

build:
	docker build -t test-nginx -f ./docker/nginx/Dockerfile .
	docker build -t test-php -f ./docker/php/Dockerfile .

push:
	#docker push 618342723525.dkr.ecr.us-west-2.amazonaws.com/ash-nginx

deploy: build, push

run:
ifeq ($(ENVIRONMENT), ${LOCAL})
	docker run -dti --name ${PHP_CONTAINER_NAME} -v ${PWD}:/var/www/html test-php
	docker run -dti --name ${NGINX_CONTAINER_NAME} --link ${PHP_CONTAINER_NAME} -p 8000:80 test-nginx
else
	docker run -dti --name ${PHP_CONTAINER_NAME} test-php
	docker run -dti --name ${NGINX_CONTAINER_NAME} --link php -p 8000:80 test-nginx
endif

prune: stop remove

stop:
	docker stop ${NGINX_CONTAINER_NAME} ${PHP_CONTAINER_NAME}

remove:
	docker rm ${NGINX_CONTAINER_NAME} ${PHP_CONTAINER_NAME}
	docker rmi test-nginx test-php

test:
	docker exec -it ${PHP_CONTAINER_NAME} /bin/bash -c "composer phpcs && composer tests"