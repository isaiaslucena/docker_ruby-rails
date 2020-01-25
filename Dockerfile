FROM ubuntu:bionic
MAINTAINER Isaias Neto <isaiasneto@gmail.com>

ENV TZ America/Sao_Paulo

RUN apt-get update && \
		DEBIAN_FRONTEND=noninteractive apt-get install -yq \
		curl git unzip software-properties-common && \
		rm -rf /var/lib/apt/lists/* && \
        apt-add-repository -y ppa:rael-gc/rvm && \
        apt-get update && \
        apt-get install rvm


        gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB && \
        curl -sSL https://get.rvm.io | bash \
		curl -sL https://deb.nodesource.com/setup_12.x | bash - && apt-get install -yq nodejs && \
		curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
		echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
		apt-get update && apt-get install -yq yarn

ADD run.sh /run.sh
RUN chmod 755 /run.sh

ADD FIRST_RUN /FIRST_RUN

RUN mkdir -p /app

EXPOSE 3000

WORKDIR /app

CMD ["/run.sh"]
