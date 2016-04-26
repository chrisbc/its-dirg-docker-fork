#!/bin/bash
#
# To debug your container:
#
#   DOCKERARGS="--entrypoint /bin/bash" bash -x ./run.sh
#

machine_name=oidc-demo
image=dirg_example_rp
name=rp
host_port=8666

# Check if running on mac
if [ $(uname) = "Darwin" ]; then
    # Check so the boot2docker vm is running
    if [ $(docker-machine status ${machine_name}) != "Running" ]; then
        docker-machine start ${machine_name}
    fi
    #$(boot shellinit)
    HOST_IP=$(docker-machine ip ${machine_name})
else
    # if running on linux
    if [ $(id -u) -ne 0 ]; then
        sudo="sudo"
    fi
    HOST_IP=$(ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | grep -v '172.17' | cut -d: -f2 | awk '{ print $1}' | head -1)
fi

echo "HOST IP: " ${HOST_IP}

${sudo} docker run --rm=true \
    --name ${name} \
    -v $PWD/settings:/opt/dirg/settings \
    -p ${host_port}:8666 \
    -e BASE_URL="https://${HOST_IP}:${host_port}" \
    $DOCKERARGS \
    -i -t \
    ${image}
