#!/bin/bash

gpg --gen-key
gpg --output key.pub --armor --export $KEYID

dpkg-scanpackages focal/ > focal/Packages
gzip --keep --force -9 focal/Packages

cat Release > focal/Release
apt-ftparchive release focal/ >> focal/Release

gpg -abs -o focal/Release.gpg focal/Release
gpg --clearsign --digest-algo SHA512 -o focal/InRelease focal/Release

echo 'deb http://localhost/debs/ focal/' > /etc/apt/sources.list.d/localhost.list

curl http://localhost/debs/key.pub | apt-key add -
