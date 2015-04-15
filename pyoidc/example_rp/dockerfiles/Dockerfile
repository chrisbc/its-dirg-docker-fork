FROM itsdirg/dirg_base

MAINTAINER DIRG <dirg@its.umu.se>

VOLUME ["/opt/dirg/settings"]

ADD setup.sh /setup.sh
RUN /setup.sh

ADD start.sh /start.sh

WORKDIR /

CMD ["bash", "./start.sh"]
