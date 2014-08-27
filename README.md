## Sinopia (Docker Image)

Sinopia is a private npm repository server

### Installing Image

`docker pull keyvanfatehi/sinopia:0.9.1`

### Creating Container

`docker run --name sinopia -d -p 4873:4873 keyvanfatehi/sinopia:0.9.1`

### Setting Registry

`npm set registry http://<docker_host>:4873/`

### Determining Username and Password

`docker logs sinopia`

### Modify configuration

```
docker stop sinopia
docker run --volumes-from sinopia -it ubuntu vi /opt/sinopia/config.yaml
docker stop sinopia
```

### Backups

`docker run --volumes-from sinopia -v $(pwd):/backup ubuntu tar cvf /backup/backup.tar /opt/sinopia`

Alternatively, host path for /opt/sinopia can be determined by running:

`docker inspect sinopia`

### Restore

```
docker stop sinopia
docker rm sinopia
docker run --name sinopia -d -p 4873:4873 keyvanfatehi/sinopia:0.9.1
docker stop sinopia
docker run --volumes-from sinopia -v $(pwd):/backup ubuntu tar xvf /backup/backup.tar
docker start sinopia
```

## Links

* [Sinopia on Github](https://github.com/rlidwka/sinopia)
