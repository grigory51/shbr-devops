#!/bin/bash
set -e

mkdir -p "$DESTDIR/usr/bin/"
mkdir -p "$DESTDIR/etc/systemd/system/"

cp shbr-echo "$DESTDIR/usr/bin/shbr-echo"
cp ../shbr-echo.service "$DESTDIR/etc/systemd/system/"