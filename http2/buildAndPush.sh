#!/usr/bin/env bash

VERSION="1.13.6"

docker build --rm -t portlands/http2 .

docker tag portlands/http2 portlands/http2:$VERSION
docker tag portlands/http2 portlands/http2:latest

docker push portlands/http2:$VERSION
docker push portlands/http2:latest
