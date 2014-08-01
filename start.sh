#!/bin/bash

nodejs /opt/sinopia/config_gen.js
cat /tmp/config.yaml
sed 's/\#listen\: localhost/listen\: 0.0.0.0/' /tmp/config.yaml > /opt/sinopia/config.yaml
nodejs /node_modules/sinopia/bin/sinopia --config /opt/sinopia/config.yaml
