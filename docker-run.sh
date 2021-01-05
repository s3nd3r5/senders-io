FLAG=-it
if [ "$1" == "-d" ]; then
  FLAG="-d"
fi

docker run $FLAG -v $PWD/www:/usr/share/nginx/html:ro nginx:latest
