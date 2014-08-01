## Sinopia (Docker Image)

Sinopia is a private npm repository server

### Installing Image

`docker pull keyvanfatehi/docker-sinopia`

### Creating Container

`docker run -name sinopia -d -p 4873:4873 -v /path/to/host/storage:/opt/sinopia/storage keyvanfatehi/docker-sinopia`

### Setting Registry

`npm set registry http://<docker_host>:4873/`

### Determining Username and Password

`docker logs sinopia`

## Links

* [Sinopia on Github](https://github.com/rlidwka/sinopia)
* [Sinopia on Docker](https://index.docker.io/u/keyvanfatehi/docker-sinopia/)
