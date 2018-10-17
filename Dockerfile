FROM ubuntu:18.04

LABEL maintainer="4eixos <info@4eixos.com>"

# Update system packages
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update && apt-get dist-upgrade -y \
    && apt-get autoremove -y && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install supervisor 
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update && apt-get install -y --no-install-recommends supervisor \
    && mkdir -p /var/log/supervisor && mkdir -p /etc/supervisor/conf.d \
    && apt-get autoremove -y && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

# Iniciar supervisor con el contenedor
CMD ["supervisord", "-n"]
