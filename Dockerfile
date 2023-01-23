FROM ubuntu

ENV SQUID_CACHE_DIR=/var/spool/squid \
    SQUID_LOG_DIR=/var/log/squid \
    SQUID_USER=proxy
    # SQUID_VERSION=5.2

# update ubuntu and install squid
RUN apt-get update \
    && apt-get install -y squid-openssl \
    && /usr/lib/squid/security_file_certgen -c -s /var/spool/squid/ssl_db -M 4MB \
    && chown -R proxy: /var/spool/squid/ssl_db

# add following section for local image testing.
# for running ng AWS it is not needed and comment it
RUN install -y vim \
    && apt install -y curl \
    && apt install -y wget \
    && apt install -y iputils-ping \
    && apt install -y telnet

# # you can add whitelist, blackilist and squid.conf
# COPY whitelist_URL.txt /etc/squid/whitelist_URL.txt
# COPY whitelist_IP.txt /etc/squid/whitelist_IP.txt
# COPY squid.conf /etc/squid/squid.conf

# copy entrypoint script to keep container alive, give it a rights and run it
COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

EXPOSE 3128/tcp
ENTRYPOINT ["/sbin/entrypoint.sh"]
# # If want to associate the container with volume in AWS
# VOLUME ["/var/log/squid"]
