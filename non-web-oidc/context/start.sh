#!/bin/sh

echo ${HOST_IP}

if [ -z "${HOST_IP}" ]; then
    export HOST_IP="127.0.0.1"
fi

cd /tmp/non-web-oidc-1.0/src/op/op
python op.py -p 8080 -b "https://${HOST_IP}" op_conf &

sleep 3 # wait for op to start

cd /tmp/non-web-oidc-1.0/src/service_provider
python service_provider.py -p 8090 -b "https://${HOST_IP}" --provider "https://${HOST_IP}:8080" rp_conf &

cd /tmp/non-web-oidc-1.0/src/test_application_login_service
python login_server.py -p 9000 "https://${HOST_IP}:8090" &

wait