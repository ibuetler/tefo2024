#!/bin/bash
# setup PKI
./easyrsa --batch init-pki
./easyrsa --batch build-ca nopass

# create wildcard cert
FQDN="dynpentestlab.ch"
CERT_FILENAME="wildcard.${FQDN}"
CERT_COMMONNAME="*.${FQDN}"
./easyrsa --batch --req-cn="${CERT_COMMONNAME}" gen-req ${CERT_FILENAME} nopass
./easyrsa --batch sign-req server ${CERT_FILENAME}
./easyrsa --batch gen-dh


# create covenant cert
FQDN="dynpentestlab.ch"
CERT_FILENAME="covenant.${FQDN}"
CERT_COMMONNAME="covenant.${FQDN}"
./easyrsa --batch --req-cn="${CERT_COMMONNAME}" gen-req ${CERT_FILENAME} nopass
./easyrsa --batch sign-req server ${CERT_FILENAME}


# create full chain.pem
cat ./pki/ca.crt > ./pki/issued/covenant-fullchain.crt
cat ./pki/issued/covenant.dynpentestlab.ch.crt >> ./pki/issued/covenant-fullchain.crt

# create pfx for covenant
openssl pkcs12 -export -in ./pki/issued/covenant-fullchain.crt -inkey ./pki/private/covenant.dynpentestlab.ch.key -out ./pki/issued/covenant-fullchain.pfx -name covenant.dynpentestlab.ch -passout pass:CovenantDev


