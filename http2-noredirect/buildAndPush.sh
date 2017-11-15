#!/usr/bin/env bash

VERSION="1.13.6"

docker build --rm -t portlands/http2-noredirect .

docker tag portlands/http2-noredirect portlands/http2-noredirect:$VERSION
docker tag portlands/http2-noredirect portlands/http2-noredirect:latest

docker push portlands/http2-noredirect:$VERSION
docker push portlands/http2-noredirect:latest
