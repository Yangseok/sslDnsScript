#!/bin/bash

#docker usermod
read -p "install now? [y/n] : " yynn
if [ $yynn != 'y' ]
then
  echo "End Script"
  exit 1
fi

docker docker run -it --rm --name certbot \
  -v '/etc/letsencrypt:/etc/letsencrypt' \
  -v '/var/lib/letsencrypt:/var/lib/letsencrypt' \
  certbot/certbot renew --manual --preferred-challenges dns --server https://acme-v02.api.letsencrypt.org/directory
