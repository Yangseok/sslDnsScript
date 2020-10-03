#!/bin/bash

#docker usermod
read -p "install now? [y/n] : " yynn
if [ $yynn != 'y' ]
then
  echo "End Script"
  exit 1
fi

read -p "certbot certonly yourdomain ex)*.yourdomain.com : " yourdomain

read -p "select yourdomain : "$yourdomain"? [y/n] : " yynn
if [ $yynn == 'y' ]
then
  echo "Start Script"
else
  echo "End Script"
  exit 1
fi

docker run -it --rm --name certbot \
  -v '/etc/letsencrypt:/etc/letsencrypt' \
  -v '/var/lib/letsencrypt:/var/lib/letsencrypt' \
  certbot/certbot certonly -d "$yourdomain" --manual --preferred-challenges dns --server https://acme-v02.api.letsencrypt.org/directory