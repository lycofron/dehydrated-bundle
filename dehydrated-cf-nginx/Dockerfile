FROM lycofron/dehydrated-cf:latest

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62  && \
    echo "deb http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list  && apt-get update  && \
    apt-get install --no-install-recommends --no-install-suggests -y       ca-certificates       \
    nginx=${NGINX_VERSION}       nginx-module-xslt       nginx-module-geoip       nginx-module-image-filter       \
    nginx-module-perl       nginx-module-njs       gettext-base  && rm -rf /var/lib/apt/lists/*  

RUN ln -sf /dev/stdout /var/log/nginx/access.log  && ln -sf /dev/stderr /var/log/nginx/error.log

RUN mkdir /etc/nginx/certs

EXPOSE 443/tcp 80/tcp

CMD "nginx -g 'daemon off;'"
          
LABEL org.freenas.interactive=false \
      org.freenas.version=2 \
      org.freenas.upgradeable=false \
      org.freenas.expose-ports-at-host=true \
      org.freenas.autostart=true \
      org.freenas.port-mappings=80:8080/tcp,443:8081/tcp \
      org.freenas.volumes=[                                  \
      {                                        \
            "name": "/usr/share/nginx/html",   \
            "descr": "html content"            \
      },                                        \
      {                                        \
            "name": "/etc/nginx/conf.d",       \
            "descr": "Configuration Directory" 
      },
      {                                        \
            "name": "/etc/nginx/certs",        \
            "descr": "Certificate directory"   \
      }
