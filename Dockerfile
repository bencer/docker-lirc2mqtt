FROM ubuntu:zesty
MAINTAINER Jorge Salamero Sanz <bencer@cauterized.net>

RUN apt-get update && apt-get install -y \
    lirc \
    supervisor \
    npm \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/lirc && \
    mv /etc/lirc/lircd.conf.d/devinput.lircd.conf \
       /etc/lirc/lircd.conf.d/devinput.lircd.conf.dist
RUN npm install -g lirc2mqtt
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]
