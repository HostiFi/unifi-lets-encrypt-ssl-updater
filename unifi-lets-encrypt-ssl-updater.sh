#!/bin/bash
while getopts e:d: option; do
  case $option in
    "d") DOMAINS+=("$OPTARG");;
    "e") EMAIL=${OPTARG};;
  esac
done
echo $EMAIL;
for DOMAIN in "${DOMAINS[@]}"; do
  stringprefix=" --domain "
  stringpostfix=" "
  DOMAINSTR+=$stringprefix$DOMAIN$stringpostfix
done
echo $DOMAINSTR;

certbot --nginx --email $EMAIL --agree-tos --no-eff-email --expand $DOMAINSTR --no-redirect
wget -O /root/unifi-lets-encrypt-ssl-importer.sh https://raw.githubusercontent.com/HostiFi/unifi-lets-encrypt-ssl-importer/master/unifi-lets-encrypt-ssl-importer.sh
/bin/bash /root/unifi-lets-encrypt-ssl-importer.sh -d ${DOMAINS[0]}
