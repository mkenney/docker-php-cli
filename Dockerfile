FROM php:7-cli

MAINTAINER Michael Kenney <mkenney@webbedlam.com>

# System update
RUN apt-get -q -y update

# Because some basic tools come in handy...
RUN apt-get install -q -y less

# Configure terminal
COPY container/root/ /root/

# Packages
RUN apt-get install -q -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng12-dev \
    libbz2-dev \
    php-pear \
    curl \
    unzip

# Install PHP modules
RUN docker-php-ext-install pdo pdo_mysql mcrypt zip bz2 mbstring \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && echo "error_reporting=E_ALL" > $PHP_INI_DIR/conf.d/error_reporting.ini \
    && echo "memory_limit=-1" > $PHP_INI_DIR/conf.d/memory-limit.ini \
    && echo "date.timezone=${PHP_TIMEZONE:-UTC}" > $PHP_INI_DIR/conf.d/date_timezone.ini

RUN apt-get clean && rm -r /var/lib/apt/lists/*

VOLUME ["/app"]
WORKDIR /app
ENV TERM xterm

ENTRYPOINT ["php"]
