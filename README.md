## Sinopia (Docker Image)

Sinopia is a private npm repository server

### Installing Image

`docker pull keyvanfatehi/sinopia:0.13.0`

### Creating Container

`docker run --name sinopia -d -p 4873:4873 keyvanfatehi/sinopia:0.13.0`

### Setting Registry

`npm set registry http://<docker_host>:4873/`

### Determining Username and Password

`docker logs sinopia`

### Modify configuration

```
# Save the config file
curl -L https://github.com/rlidwka/sinopia/blob/master/conf/default.yaml -o /path/to/config.yaml
# Mount the config file to the exposed data volume
docker run -v /path/to/config.yaml:/opt/sinopia/config.yaml --name sinopia -d -p 4873:4873 keyvanfatehi/sinopia:0.13.0
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
docker run --name sinopia -d -p 4873:4873 keyvanfatehi/sinopia:0.12.0
docker stop sinopia
docker run --volumes-from sinopia -v $(pwd):/backup ubuntu tar xvf /backup/backup.tar
docker start sinopia
```

## Links

* [Sinopia on Github](https://github.com/rlidwka/sinopia)
