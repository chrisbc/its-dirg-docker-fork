#!/bin/sh

tar xfC /tmp/code.tar.gz /tmp/
pip install -r /tmp/non-web-oidc-1.0/src/op/requirements.txt
pip install -r /tmp/non-web-oidc-1.0/src/service_provider/requirements.txt
mv /tmp/rp_conf.py /tmp/non-web-oidc-1.0/src/service_provider/rp_conf.py
mv /tmp/op_conf.py /tmp/non-web-oidc-1.0/src/op/op/op_conf.py
