#!/bin/bash

echo "Building."

if [ -z "$DOCKER" ]; then
    DOCKER=docker
fi

if [ -z "$STREAM_PORT" ]; then
    STREAM_PORT=80
fi

if [ "$1" == "--allowed-ip" ]; then
  ALLOWED_IP="$2"
fi

if [ -n "$ALLOWED_IP" ]; then
  $DOCKER build --build-arg "ALLOWED_IP=$ALLOWED_IP"  -t stream . || exit $?
else
  $DOCKER build -t stream . || exit $?
fi

echo "Running."
$DOCKER run --rm -it -p $STREAM_PORT:80 -p 1935:1935 stream
