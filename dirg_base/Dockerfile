FROM debian:jessie

#MAINTAINER DIRG <dirg@its.umu.se>

RUN apt-get update && \
    apt-get install -y --no-install-recommends\
	git \
	python-dev \
	python-pip \
	python-openssl \
	build-essential \
	python-virtualenv && \
    apt-get clean

WORKDIR /
