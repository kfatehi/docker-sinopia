## Sinopia (Docker Image)

Sinopia is a private npm repository server

### Installing Image

`docker pull keyvanfatehi/sinopia:latest`

### Creating Container

`docker run --name sinopia -d -p 4873:4873 keyvanfatehi/sinopia:latest`

### Setting Registry

`npm set registry http://<docker_host>:4873/`

### Determining Username and Password

`docker logs sinopia`

### Modify configuration

There are two ways to modify the configuration.

To understand the difference, view the conversation here: https://github.com/keyvanfatehi/docker-sinopia/pull/10

### Original Method

```
docker stop sinopia
docker run --volumes-from sinopia -it --rm ubuntu vi /opt/sinopia/config.yaml
docker start sinopia
```

### Alternative Method

```
# Save the config file
curl -L https://raw.githubusercontent.com/rlidwka/sinopia/master/conf/default.yaml -o /path/to/config.yaml
# Mount the config file to the exposed data volume
docker run -v /path/to/config.yaml:/opt/sinopia/config.yaml --name sinopia -d -p 4873:4873 keyvanfatehi/sinopia:latest
```

Restart the container anytime you change the config.

### Backups

`docker run --volumes-from sinopia -v $(pwd):/backup ubuntu tar cvf /backup/backup.tar /opt/sinopia`

Alternatively, host path for /opt/sinopia can be determined by running:

`docker inspect sinopia`

### Restore

```
docker stop sinopia
docker rm sinopia
docker run --name sinopia -d -p 4873:4873 keyvanfatehi/sinopia:latest
docker stop sinopia
docker run --volumes-from sinopia -v $(pwd):/backup ubuntu tar xvf /backup/backup.tar
docker start sinopia
```

## Links

* [Sinopia on Github](https://github.com/rlidwka/sinopia)
