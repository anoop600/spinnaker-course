#!/bin/bash

# env flags that need to be set:




CLIENT_ID=d6f056b328e711341cd6
CLIENT_SECRET=b7dba4917a54f871c440ef5327c29deecdddf54f
PROVIDER=github
#MY_IP=`curl -s ifconfig.co`
#CLIENT_ID=545191397930-4fq8onr8l4a1vvdp50tqqqnti2qgq8cb.apps.googleusercontent.com
#CLIENT_SECRET=Jy-tZUobamBwPUNqZBVOU5zr
MY_IP=ec2-13-250-103-107.ap-southeast-1.compute.amazonaws.com
#PROVIDER=google
REDIRECT_URI=http://${MY_IP}:8084/login

set -e

if [ -z "${CLIENT_ID}" ] ; then
  echo "CLIENT_ID not set"
  exit
fi
if [ -z "${CLIENT_SECRET}" ] ; then
  echo "CLIENT_SECRET not set"
  exit
fi
if [ -z "${PROVIDER}" ] ; then
  echo "PROVIDER not set"
  exit
fi
if [ -z "${REDIRECT_URI}" ] ; then
  echo "REDIRECT_URI not set"
  exit
fi

#MY_IP=`curl -s ifconfig.co`

hal config security authn oauth2 edit \
  --client-id $CLIENT_ID \
  --client-secret $CLIENT_SECRET \
  --provider $PROVIDER \
  --user-info-requirements hd=${MY_IP}
  
hal config security authn oauth2 enable

hal config security authn oauth2 edit --pre-established-redirect-uri $REDIRECT_URI

hal config security ui edit \
    --override-base-url http://${MY_IP}:9000

hal config security api edit \
    --override-base-url http://${MY_IP}:8084
