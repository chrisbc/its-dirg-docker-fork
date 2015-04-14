FROM itsdirg/dirg_base
MAINTAINER DIRG, dirg@its.umu.se

RUN apt-get update && apt-get install -y --no-install-recommends \
    libffi-dev \
    libssl-dev

ADD https://github.com/its-dirg/non-web-oidc/archive/v1.0.tar.gz /tmp/code.tar.gz
COPY setup.sh start.sh rp_conf.py op_conf.py /tmp/

RUN /tmp/setup.sh

EXPOSE 8080 8090 9000

ENTRYPOINT ["/tmp/start.sh"]
