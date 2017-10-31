#!/usr/bin/env bash

docker stop http2 
docker rm http2
docker run -d -p 80:80 -p 443:443 --name http2 portlands/http2
docker logs -f http2
