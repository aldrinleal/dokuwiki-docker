FROM php:5.6.10-fpm

MAINTAINER Aldrin Leal <aldrin@leal.eng.br>

COPY seed-dokuwiki.sh /usr/local/bin/

COPY prepare-packages.sh install-dokuwiki.sh /tmp/

RUN bash /tmp/prepare-packages.sh

ENV DOKUWIKI_VERSION 2014-09-29d
ENV DOKUWIKI_CSUM 2bf2d6c242c00e9c97f0647e71583375

RUN bash /tmp/install-dokuwiki.sh

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY configure-dokuwiki.sh dokuwiki.conf php-fpm.conf /tmp/

RUN bash /tmp/configure-dokuwiki.sh && rm -rvf /tmp/*

EXPOSE 80

VOLUME ["/dokuwiki/data/", "/dokuwiki/lib/plugins/", "/dokuwiki/conf/", "/dokuwiki/lib/tpl/" ]

CMD [ "/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/conf.d/supervisord.conf" ]

