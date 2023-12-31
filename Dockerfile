FROM php:8.3-cli-alpine

LABEL org.opencontainers.imageauthors.name='Fernando Braga Alves'
LABEL org.opencontainers.imageauthors.email='f.braga.alves1@gmail.com'
LABEL org.opencontainers.image.source=https://github.com/falves97/superviser-php/
LABEL org.opencontainers.image.description="Basic image to create PHP processes with supervisor"
LABEL org.opencontainers.image.licenses=MIT

RUN apk add --update supervisor && rm  -rf /tmp/* /var/cache/apk/*

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions \
	    apcu \
		intl \
		opcache \
		zip \
		mysqli \
		pdo_mysql \
		pdo_pgsql \
		pgsql

ADD supervisord.conf /etc/

ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]
