#!/bin/bash

set -x

wget -O /dokuwiki.tgz "http://download.dokuwiki.org/src/dokuwiki/dokuwiki-$DOKUWIKI_VERSION.tgz"

RECV_CSUM=$(md5sum /dokuwiki.tgz | awk '{print($1)}')

if [ "$DOKUWIKI_CSUM" != "$RECV_CSUM" ]; then 
	echo "Wrong md5sum of downloaded file (received: $RECV_CSUM; expected: $DOKUWIKI_CSUM)"
	exit 1
fi

mkdir /dokuwiki

tar -zxf /dokuwiki.tgz --strip-components=1 -C /dokuwiki

chown -R www-data:www-data /dokuwiki
