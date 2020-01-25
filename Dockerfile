FROM ubuntu:bionic
MAINTAINER Isaias Neto <isaiasneto@gmail.com>

ENV TZ America/Sao_Paulo

RUN apt-get update && \
		DEBIAN_FRONTEND=noninteractive apt-get install -yq \
		curl git unzip software-properties-common && \
        apt-add-repository -y ppa:rael-gc/rvm && \
        apt-get install -y rvm && \
        rm -rf /var/lib/apt/lists/*

ADD run.sh /run.sh
RUN chmod 755 /run.sh

ADD FIRST_RUN /FIRST_RUN

RUN mkdir -p /app

EXPOSE 3000

WORKDIR /app

CMD ["/run.sh"]
