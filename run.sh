#!/bin/bash

echo "Building."
docker build -t stream . || exit $?

echo "Running."
docker run --rm -it -p 80:80 -p 1935:1935 stream
