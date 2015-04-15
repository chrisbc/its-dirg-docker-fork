#!/bin/bash
#
# To debug your container:
#
#   DOCKERARGS="--entrypoint /bin/bash" bash -x ./run.sh
#

image=pyoidc_example_rp
name=rp

# Check if running on mac
if [ $(uname) = "Darwin" ]; then
    # Check so the boot2docker vm is running
    if [ $(boot2docker status) != "running" ]; then
        boot2docker start
    fi
    $(boot2docker shellinit)
    HOST_IP=$(boot2docker ip)
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
    -p 8666:8666 \
    -e HOST_IP=${HOST_IP} \
    $DOCKERARGS \
    -i -t \
    ${image}
