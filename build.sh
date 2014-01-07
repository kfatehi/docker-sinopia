rm -rf node_modules
npm install sinopia
echo "Please hit Ctrl-C to generate config.yaml and README"
yes | node_modules/sinopia > INFO
sudo docker build -t keyvanfatehi/docker-sinopia .
