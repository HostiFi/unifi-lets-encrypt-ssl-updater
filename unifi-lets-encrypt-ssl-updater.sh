#!/bin/bash
while getopts e:d: option
do
case "${option}"
in
e) EMAIL=${OPTARG};;
d) HOSTNAMEVAR=${OPTARG};;
esac
done

certbot --nginx --email $EMAIL --agree-tos --no-eff-email --domain $HOSTNAMEVAR --no-redirect
wget -O /root/unifi-lets-encrypt-ssl-importer.sh https://raw.githubusercontent.com/HostiFi/unifi-lets-encrypt-ssl-importer/master/unifi-lets-encrypt-ssl-importer.sh
/bin/bash /root/unifi-lets-encrypt-ssl-importer.sh -d $HOSTNAMEVAR
