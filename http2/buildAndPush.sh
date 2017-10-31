#!/usr/bin/env bash

docker build --rm -t portlands/http2 .

docker tag http2 portlands/http2:latest
docker push portlands/http2:latest
