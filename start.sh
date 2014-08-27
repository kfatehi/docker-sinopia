#!/bin/bash

if [ ! -f config.yaml ]; then
  nodejs /opt/sinopia/config_gen.js
  sed -e 's/\#listen\: localhost/listen\: 0.0.0.0/' /tmp/config.yaml > /opt/sinopia/config.yaml
fi
cat /opt/sinopia/config.yaml
nodejs /node_modules/sinopia/bin/sinopia --config /opt/sinopia/config.yaml
