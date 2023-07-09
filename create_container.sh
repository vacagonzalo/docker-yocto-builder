#!/bin/bash

if [[ -z $WORKSPACE ]]; then
  echo "please set the WORKSPACE with 'export WORKSPACE=<some/path>'"
  exit 1
fi

if [ ! -d $WORKSPACE ]; then
  echo "could not reach the folder: ${WORKSPACE}"
  exit 1
fi

TOTAL_MEMORY=$(free -g | awk '/Mem:/ {print $2}')
SAVE_MEMORY=4
USED_MEMORY=$(($TOTAL_MEMORY - $SAVE_MEMORY))
echo "         Memory[GB]"
echo "   Total ${TOTAL_MEMORY}"
echo "Reserved ${SAVE_MEMORY}"
echo "    Used ${USED_MEMORY}"

docker run -ti \
  -e DISPLAY=$DISPLAY \
  --net="host" \
  --name="yocto-builder" \
  --hostname="yocto-builder" \
  --memory="${USED_MEMORY}g" \
  -v $WORKSPACE:/home/dev/workspace \
  yocto-builder
  /bin/bash