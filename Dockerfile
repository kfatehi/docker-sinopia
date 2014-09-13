FROM dockerfile/nodejs
MAINTAINER Keyvan Fatehi <keyvanfatehi@gmail.com>
RUN npm install js-yaml sinopia@0.9.3
RUN adduser --disabled-password --gecos "" sinopia
RUN mkdir -p /opt/sinopia/storage
RUN chown -R sinopia:sinopia /opt/sinopia
USER sinopia
WORKDIR /opt/sinopia
ADD /config_gen.js /opt/sinopia/config_gen.js
ADD /start.sh /opt/sinopia/start.sh
CMD ["/opt/sinopia/start.sh"]
EXPOSE 4873
VOLUME /opt/sinopia
