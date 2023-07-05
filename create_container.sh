#!/bin/bash

if [[ -z $WORKSPACE ]]; then
  echo "please set the WORKSPACE with 'export WORKSPACE=<some/path>'"
  exit 1
fi

if [ ! -d $WORKSPACE ]; then
  echo "could not reach the folder: ${WORKSPACE}"
  exit 1
fi

docker run -ti \
  -e DISPLAY=$DISPLAY \
  --net="host" \
  --name="yocto-builder" \
  --hostname="yocto-builder" \
  -v $WORKSPACE:/home/dev/workspace \
  yocto-builder
  /bin/bash