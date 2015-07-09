#!/bin/bash

set -x

install -m 644 /tmp/dokuwiki.conf /etc/lighttpd/conf-available/20-dokuwiki.conf

install -m 644 /tmp/php-fpm.conf /usr/local/etc/php-fpm.conf

lighty-enable-mod dokuwiki


