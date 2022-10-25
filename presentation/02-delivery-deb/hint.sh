#!/bin/bash

gpg --gen-key
gpg --output key.pub --armor --export $KEYID

dpkg-scanpackages jammy/ > jammy/Packages
gzip --keep --force -9 jammy/Packages

cat Release > jammy/Release
apt-ftparchive release jammy/ >> jammy/Release

gpg -abs -o jammy/Release.gpg jammy/Release
gpg --clearsign --digest-algo SHA512 -o jammy/InRelease jammy/Release

echo 'deb http://localhost/debs/ jammy/' > /etc/apt/sources.list.d/localhost.list

curl http://localhost/debs/key.pub | apt-key add -
