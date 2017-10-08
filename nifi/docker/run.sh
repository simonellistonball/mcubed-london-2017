#!/bin/sh
docker run -d -p 3000:3000 -p 3001:3001 -p 8080:8080 -v /Users:/Users --name m3nifi -it m3nifi

while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' localhost:8080)" != "200" ]]; do sleep 5; done
sleep 5
./template.sh 
