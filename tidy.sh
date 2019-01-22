#!/usr/bin/env bash
find . -name '*.html' -type f -print -exec tidy -mq -config tidy.conf '{}' \;
