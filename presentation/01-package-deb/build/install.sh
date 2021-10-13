#!/bin/bash
set -e

mkdir -p "$DESTDIR/usr/bin/"

cp libs/java-0.0.1-SNAPSHOT.jar "$DESTDIR/usr/bin/shbr-echo.jar"
cp main.py "$DESTDIR/usr/bin/shbr-echo.py"