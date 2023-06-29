#!/bin/bash
set -e

if [ -d /shbr-echo/cpp/build_release ]; then
  sudo chown shbr:shbr /shbr-echo/cpp/build_release
fi

if [ -d /home/shbr/.gradle ]; then
  sudo chown shbr:shbr /home/shbr/.gradle
fi

exec "$@"