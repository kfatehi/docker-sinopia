# Depracation Notice

Hi everyone, this project is **no longer mainained**.

Please use [verdaccio/verdaccio](https://github.com/verdaccio/verdaccio) and [its official Docker Image](https://github.com/verdaccio/verdaccio#docker)



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

### configure Vagrant
 
Setting the npm registry to `http://localhost:4873` in a Dockerfile which should point to the sinopia registry locally will not work during the `docker build` process, since localhost:4873 references to the Docker container itself and not the host-machine where sinopia runs.
With the Vagrant configuration one could locally spin up this Dockerfile in a vbox with the command `vagrant up` and reference this registry it in a 'target'-Dockerfile with `RUN npm set registry http://10.10.10.10:4873`.
 
```
# vagrant up
```

and in the Dockerfile of your application set

```
CMD npm set registry http://10.10.10.10:4873
```

[Vagrant](https://en.wikipedia.org/wiki/Vagrant_\(software\)) is open source. See install instructions for [mac](http://sourabhbajaj.com/mac-setup/Vagrant/README.html) or [\*nix](http://www.olindata.com/blog/2014/07/installing-vagrant-and-virtual-box-ubuntu-1404-lts). 

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
