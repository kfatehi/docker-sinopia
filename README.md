## Sinopia (Docker Image)

Sinopia is a private npm repository server

### Installing Image

`docker pull keyvanfatehi/sinopia:0.9.0`

### Creating Container

`docker run -name sinopia -d -p 4873:4873 -v /path/to/host/storage:/opt/sinopia/storage keyvanfatehi/sinopia:0.9.0`

### Setting Registry

`npm set registry http://<docker_host>:4873/`

### Determining Username and Password

`docker logs sinopia`

## Links

* [Sinopia on Github](https://github.com/rlidwka/sinopia)
