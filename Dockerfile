FROM drupal:9-apache-buster

RUN set -eux; \
        if command -v a2enmod; then \
                a2enmod rewrite; \
        fi; \
        savedAptMark="$(apt-mark showmanual)"; \
        apt-get update; \
        apt-get install -y --no-install-recommends \
                curl \
                vim \
                default-mysql-client \
                git \
                wget \
                npm \
                unzip;

WORKDIR /opt/drupal
COPY . .

RUN set -eux; \
    COMPOSER_MEMORY_LIMIT=-1 composer require drush/drush --no-interaction

EXPOSE 80

RUN set -eux; \
    chmod +x ./bootscript.sh

CMD ./bootscript.sh
