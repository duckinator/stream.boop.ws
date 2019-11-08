#!/bin/bash

echo "Building."

if [ "$1" == "--allowed-ip" ]; then
  ALLOWED_IP="$2"
fi

if [ -n "$ALLOWED_IP" ]; then
  docker build --build-arg "ALLOWED_IP=$ALLOWED_IP"  -t stream . || exit $?
else
  docker build -t stream . || exit $?
fi

echo "Running."
docker run --rm -it --entrypoint /bin/bash -p 80:80 -p 1935:1935 stream
