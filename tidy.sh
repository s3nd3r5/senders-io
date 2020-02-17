#!/usr/bin/env bash

if [ $# == 0 ]; then
  find . -name '*.html' -type f -print -exec tidy -mq -config tidy.conf '{}' \;
else
  tidy -mq -config tidy.conf $@
fi
