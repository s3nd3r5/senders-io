#!/usr/bin/env bash
set -e
# Help

if [ "$1" == "--help" ]; then
  HELP=1
fi
if [ $# == 0 ]; then
  HELP=1
fi

if [ "$HELP" == "1" ]; then
  echo "./new-blog [iso-date]"
  echo "         This will create a new file in www/blog with the date sent."
  echo "         It will also add the necessary boilerplate to the html file."
fi

DATE=$1


# Init File
mkdir www/blog/${DATE}
cat templates/blog.html > www/blog/${DATE}/index.html

