#!/bin/bash -x

if [[ -f "/FIRST_RUN" ]] ; then
	rm -rf /FIRST_RUN
	gem install bundler:2.0.2
	bundle install
fi

rm -rf /app/tmp/pids/server.pid
source .env
rails s -b 0.0.0.0 -p 8080