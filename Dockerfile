FROM alpine:3.4

MAINTAINER Omnys srl <sistemi@omnys.com>

RUN apk --no-cache upgrade && \
    apk add --no-cache --virtual=run-deps certbot && \
    rm -rf /tmp/* /var/cache/apk/* /var/tmp/*

COPY ./docker-entrypoint.sh /

RUN chmod +x ./docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["certbot"]
