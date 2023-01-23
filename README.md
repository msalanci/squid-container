# squid-container
this is a basic image for squid, running on ubuntu. It can be used on AWS to build a squid container.

If you want to use custom squid.conf, create it with your prefferences, add it to same folder as Dockerfile is and call it to the image by uncomenting string:
# COPY squid.conf /etc/squid/squid.conf

If you want to use custom whitelist and blacklist for http domains, specify it in the same folder as Dockerfile and uncomenting sections in Dockerfile:
# COPY whitelist_URL.txt /etc/squid/whitelist_URL.txt
# COPY whitelist_IP.txt /etc/squid/whitelist_IP.txt

Don't forget to add those files into squid.conf file, as:
acl allowed_http_urls dstdomain "/etc/squid/whitelist_URL.txt"
acl allowed_http_ips dst "/etc/squid/whitelist_IP.txt"
