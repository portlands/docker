#!/usr/bin/env bash

docker stop openliberty
docker rm openliberty
docker run -d -p 9080:9080 -p 9443:9443 --name openliberty portlands/openliberty
docker logs -f openliberty
