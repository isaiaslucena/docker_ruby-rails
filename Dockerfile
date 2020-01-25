FROM ruby:2.6.5
MAINTAINER Isaias Neto <isaiasneto@gmail.com>

ENV TZ America/Sao_Paulo

WORKDIR /app

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

ADD run.sh /run.sh
RUN chmod 755 /run.sh

ADD FIRST_RUN /FIRST_RUN

EXPOSE 8080

CMD ["/run.sh"]