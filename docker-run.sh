FLAG=-it
if [ "$1" == "-d" ]; then
  FLAG="-d"
fi

docker run $FLAG -v $PWD/www:/usr/share/nginx/html:ro -p 80:80 nginx:latest
