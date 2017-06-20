#!/bin/sh
set -eux
cd "$(dirname "$0")/.."
[ -d easy-rsa ] || git clone https://github.com/OpenVPN/easy-rsa
cd easy-rsa/easyrsa3
[ -d pki ] || ./easyrsa init-pki
[ -f pki/ca.crt ] || ./easyrsa --keysize=4096 build-ca nopass
for cn in stretch64; do
  [ -f pki/issued/$cn.crt ] || ./easyrsa --keysize=4096 build-server-full $cn nopass
done
[ -f pki/crl.pem ] || ./easyrsa gen-crl
