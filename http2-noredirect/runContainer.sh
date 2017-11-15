#!/usr/bin/env bash

docker stop http2-noredirect 
docker rm http2-noredirect
docker run -d -p 80:80 -p 443:443 --name http2-noredirect portlands/http2-noredirect
docker logs -f http2-noredirect
