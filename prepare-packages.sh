#!/bin/bash

set -x

buildDeps="libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng12-dev"
apt-get update
apt-get install -y $buildDeps lighttpd wget supervisor

docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

docker-php-ext-install gd iconv mcrypt

apt-get clean 

apt-get autoclean

rm -rf /var/tmp/*  
rm -rf /var/lib/apt/lists/*

