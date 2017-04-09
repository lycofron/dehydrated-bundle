FROM python:latest

RUN apt-get update && \
apt-get install -y curl sed grep mktemp git && \
cd / && \
mkdir -p /usr/local/etc/dehydrated/ && \
git clone https://github.com/lukas2511/dehydrated && \
cd dehydrated && \
mkdir domains && \
mkdir hooks && \
git clone https://github.com/kappataumu/letsencrypt-cloudflare-hook hooks/cloudflare && \
pip install -r hooks/cloudflare/requirements.txt && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/ &&
if ! [ -f /usr/local/etc/dehydrated/config ]; then echo "Yes!"; fi && echo "Cont'd"

WORKDIR /dehydrated

#CMD ./dehydrated --register --accept-terms && ./dehydrated -c
CMD /bin/bash

VOLUME /dehydrated/certs
VOLUME /dehydrated/domains
VOLUME /usr/local/etc/dehydrated
