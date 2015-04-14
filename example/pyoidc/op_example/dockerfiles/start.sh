#!/bin/bash

cd /opt/dirg/src/pyoidc-master/oidc_example/op2/

if [ -f /opt/dirg/settings/config.py ]; then
	cp /opt/dirg/settings/config.py /opt/dirg/src/pyoidc-master/oidc_example/op2/config.py
	echo "Using config.py from volume"
else
	# Use config.py.simple as op config
	mv config.py.simple config.py
	echo "Using conf.py from examlpe file"
fi

./server.py -b "https://${HOST_IP}" -p 8092 -d config
