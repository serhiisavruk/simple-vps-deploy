build:
	docker build -t test-nginx -f ./docker/nginx/Dockerfile .
	docker build -t test-php -f ./docker/php/Dockerfile .

push:
	#docker push 618342723525.dkr.ecr.us-west-2.amazonaws.com/ash-nginx

deploy: build, push

run:
	docker run -dti --name php test-php
	docker run -dti --name nginx --link php -p 8000:80 test-nginx

stop:
	docker stop nginx php

remove:
	docker rm nginx php
	docker rmi test-nginx test-php

test:
	docker exec -it php /bin/bash -c "composer phpcs && composer tests"