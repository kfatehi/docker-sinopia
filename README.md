## Sinopia (Docker Image)

Sinopia is a private npm repository server

### Installing Image

`docker pull keyvanfatehi/sinopia`

### Creating Container

`docker run -name sinopia -d -p 4873:4873 -v /path/to/host/storage:/opt/sinopia/storage keyvanfatehi/sinopia`

### Setting Registry

`npm set registry http://<docker_host>:4873/`

### Determining Username and Password

`docker logs sinopia`

## Links

* [Sinopia on Github](https://github.com/rlidwka/sinopia)
* [Sinopia on Docker](https://registry.hub.docker.com/u/keyvanfatehi/sinopia/)
