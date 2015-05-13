#!/bin/bash

cd /opt/dirg/src/pyoidc-master/oidc_example/simple_rp/

if [ -f /opt/dirg/settings/settings.yaml ]; then
	SETTINGS=/opt/dirg/setting/settings.yaml
	echo "Using settings.yaml from volume"
else
	SETTINGS=settings.yaml.example
	echo "Using settings.yaml from example file"
fi

python src/rp.py -b "https://${HOST_IP}" -p 8666 ${SETTINGS}
