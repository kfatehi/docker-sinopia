FROM keyvanfatehi/precise-nodejs-from-binary

MAINTAINER Keyvan Fatehi <keyvanfatehi@gmail.com>

ADD node_modules/sinopia /usr/local/lib/node_modules/sinopia
RUN ln -s /usr/local/lib/node_modules/sinopia/bin/sinopia /usr/local/bin/sinopia
ADD config.yaml config.yaml
RUN mkdir storage
RUN adduser --disabled-password --gecos "" sinopia
RUN chown sinopia storage
USER sinopia
EXPOSE 4873
CMD ["/usr/local/bin/sinopia"]
