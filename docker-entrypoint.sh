#!/bin/sh

if [ "$1" = 'certbot' ]; then
   if [ -z "${CERTBOT_MAIL}" ]; then
      /usr/bin/logger "ERROR: administrator email is mandatory"
   elif [ -z "${CERTBOT_DOMAINS}" ]; then
      /usr/bin/logger "ERROR: at least one domain must be specified"
   else
     #--csr CSR --cert-path CERT_PATH
     #--standalone
      exec /usr/bin/certbot certonly --verbose --noninteractive --quiet --standalone --agree-tos --email="${CERTBOT_MAIL}" -d "${CERTBOT_DOMAINS}"
   fi
elif [ "$1" = 'certbot-renew' ]; then
   exec /usr/bin/certbot renew
fi

exec "$@"
