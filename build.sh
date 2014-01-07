rm config.yaml INFO
rm -rf node_modules
npm install sinopia
yes Y | node_modules/sinopia/bin/sinopia > INFO &
pid=$!
sleep 1 # Let it make the config
sed 's/\#listen\: localhost/listen\: 0.0.0.0/' config.yaml > tmp.yaml
kill -9 $pid
rm config.yaml
mv tmp.yaml config.yaml
sudo docker build -t keyvanfatehi/docker-sinopia .
echo publish with sudo docker push keyvanfatehi/docker-sinopia
