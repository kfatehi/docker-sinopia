## docker-sinopia

### Install

`docker pull keyvanfatehi/docker-sinopia`

### Create Container

`docker run -name sinopia -d -p 4873:4873 -v /path/to/host/storage:/opt/sinopia/storage keyvanfatehi/docker-sinopia`

### Set Registry

`npm set registry http://<docker_host>:4873/`

### Determine Username and Password

`docker logs sinopia`

[Sinopia on Github](https://github.com/rlidwka/sinopia)
[Sinopia on Docker](https://index.docker.io/u/keyvanfatehi/docker-sinopia/)
