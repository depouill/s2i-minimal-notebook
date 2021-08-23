#!/bin/bash

set -eo pipefail

set -x

URI_ROOT_PATH=
export URI_ROOT_PATH

if [ x"$JUPYTERHUB_SERVICE_PREFIX" != x"" ]; then
    URI_ROOT_PATH=${JUPYTERHUB_SERVICE_PREFIX%/}
fi

cd /opt/app-root/gateway

# Don't fail on ubi8 which doesn't use scl anymore
source scl_source enable rh-nodejs10 || true

exec npm start
