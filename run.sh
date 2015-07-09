#!/bin/bash

set -x

docker run -p 8001:80 -i -v $PWD/dokuwiki/data:/dokuwiki/data -v $PWD/dokuwiki/lib/plugins:/dokuwiki/lib/plugins -v $PWD/dokuwiki/conf:/dokuwiki/conf -v $PWD/dokuwiki/lib/tpl:/dokuwiki/lib/tpl -v $PWD/var/log:/var/log aldrinleal/docker-dokuwiki:2014-09-29d
