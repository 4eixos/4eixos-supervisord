FROM 4eixos/supervisord

LABEL maintainer="4eixos <info@4eixos.com>"

# Install apache service with default configuration,
# logs to STDOUT, errors to STDERR
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update -qq && apt-get install -y --no-install-recommends apache2 \
    && apt-get autoremove -y && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && sed -i -e 's:${APACHE_LOG_DIR}/access.log:/dev/stdout:' -e 's:${APACHE_LOG_DIR}/error.log:/dev/stderr:' /etc/apache2/sites-available/*

# Set supervisord to run apache2
ADD supervisor_apache2.conf /etc/supervisor/conf.d/apache2.conf
