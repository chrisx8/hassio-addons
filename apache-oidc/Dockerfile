ARG BUILD_FROM
FROM ${BUILD_FROM}

RUN apt-get update && \
    apt-get install -y apache2 libapache2-mod-auth-openidc && \
    a2dismod -f autoindex && \
    a2enmod headers && \
    a2enmod proxy && \
    a2enmod proxy_http && \
    a2enmod rewrite && \
    a2enmod ssl && \
    rm -rf /etc/apache2/conf-available /etc/apache2/conf-enabled && \
    rm -rf /etc/apache2/sites-available /etc/apache2/sites-enabled && \
    rm -rf /var/lib/apt /var/cache/apt

COPY rootfs /
