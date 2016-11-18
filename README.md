# DOCKER CERTBOT

Cerbot client

![certbot](https://certbot.eff.org)

## Generate a new certificate

docker run --name=certbot \
  -v <path to certificates>:/etc/letsencrypt \
  -e CERTBOT_MAIL=<mail address> \
  -e CERTBOT_DOMAINS=<domains list with comma as separator> \
  -p 80:80 \
  -p 443:443 \
  certbot certbot

## Renew generated certificates

docker run --name=certbot \
  -v <path to certificates>:/etc/letsencrypt \
  -p 80:80 \
  -p 443:443 \
  certbot certbot-renew
