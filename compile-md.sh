#!/usr/bin/env bash

set -ex

if [ $# -ne 3 ]; then
  echo "./compile-md.sh [page|blog] [in.md] [out.html]"
  exit 1
fi

in=$2
out=$3

if [ $1 == "blog" ]; then
  cat templates/blog-header.html > $out
else
  if [ $1 == "page" ]; then
    cat templates/page-header.html > $out
  else
    echo "Missing first parameter: [page|blog]"
    exit 1
  fi
fi

markdown $in >> $out

if [ $1 == "blog" ]; then
  cat templates/blog-footer.html >> $out
else
  cat templates/page-footer.html >> $out
fi

./tidy.sh $out
