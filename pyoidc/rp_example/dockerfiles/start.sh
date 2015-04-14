#!/bin/bash

cd /opt/dirg/src/pyoidc-master/oidc_example/rp3/

if [ -f /opt/dirg/settings/conf.py ]; then
	cp /opt/dirg/settings/conf.py /opt/dirg/src/pyoidc-master/oidc_example/rp3/conf.py
	echo "Using conf.py from volume"
else
	# Use conf.py.example as rp config
	mv conf.py.example conf.py
	echo "Using conf.py from examlpe file"
fi

./rp3.py -b "https://${HOST_IP}" conf
