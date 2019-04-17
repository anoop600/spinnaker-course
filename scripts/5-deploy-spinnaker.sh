#!/bin/bash

# env flag that need to be set:
SPINNAKER_VERSION=1.11.12

set -e

if [ -z "${SPINNAKER_VERSION}" ] ; then
  echo "SPINNAKER_VERSION not set"
  exit
fi

sudo hal config version edit --version $SPINNAKER_VERSION

sudo hal deploy apply
