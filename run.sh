#!/bin/bash -x

if [[ -f "/FIRST_RUN" ]] ; then
	rm -rf /FIRST_RUN
	ybundle install
fi

rails s -b 0.0.0.0
