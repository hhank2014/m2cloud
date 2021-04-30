#!/bin/bash

# sh deploy.sh container_name
# $1 = container_name

container_name=$1

path="/usr/share/nginx/html"
dir="var generated vendor pub/static pub/media app/etc"

docker_cmd="docker exec -it $container_name"

$docker_cmd chown -R nginx.nginx $path

for i in $dir
do
        $docker_cmd find $path/$i -type f -exec chmod u+w {} +
        $docker_cmd find $path/$i -type d -exec chmod u+w {} +
        $docker_cmd find $path/$i -type f -exec chmod g+w {} +
        $docker_cmd find $path/$i -type d -exec chmod g+ws {} +
done
