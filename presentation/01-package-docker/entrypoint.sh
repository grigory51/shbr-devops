#!/bin/bash
set -e

if [ "$LANG" == "java" ]; then
  exec -- /usr/bin/java -jar /shbr-echo.jar
elif [ "$LANG" == "python" ]; then
  exec -- /usr/bin/python3 /shbr-echo.py
else
  echo 'Unknown language'
  exit 1;
fi
