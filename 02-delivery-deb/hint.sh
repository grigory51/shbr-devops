#!/bin/bash

gpg --gen-key
gpg --output key.pub --armor --export $KEYID

dpkg-scanpackages focal/ > focal/Packages
gzip --keep --force -9 focal/Packages

cat Release > focal/Release
apt-ftparchive release focal/ >> focal/Release