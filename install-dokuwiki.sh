#!/bin/bash

set -x

bash /usr/local/bin/seed-dokuwiki.sh

# Cleanup

lighty-enable-mod dokuwiki fastcgi accesslog

mkdir /var/run/lighttpd

chown www-data.www-data /var/run/lighttpd
