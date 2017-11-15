#!/usr/bin/env bash

VERSION="17.0.0.3"

docker build --rm -t portlands/openliberty .

#docker tag openliberty portlands/openliberty:$VERSION
#docker tag openliberty portlands/openliberty:latest

#docker push portlands/openliberty:$VERSION
#docker push portlands/openliberty:latest
