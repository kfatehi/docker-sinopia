rmi: stop-test
	docker rmi keyvanfatehi/docker-sinopia 2>&1 > /dev/null

build:
	docker build -t keyvanfatehi/docker-sinopia .

start-test: stop-test build
	docker run -p 4873:4873 --name sinopia-test -v /home/docker/sinopia-test:/opt/sinopia/storage keyvanfatehi/docker-sinopia
	docker logs sinopia-test

stop-test:
	-docker rm -f sinopia-test 2>&1 > /dev/null

test: build
	docker run --rm -i -t keyvanfatehi/docker-sinopia

shell: build
	docker run --rm -i -t keyvanfatehi/docker-sinopia /bin/bash

logs:
	docker logs sinopia-test

publish:
	docker push keyvanfatehi/docker-sinopia

test: start-test
