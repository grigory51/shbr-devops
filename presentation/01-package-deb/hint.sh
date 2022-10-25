#!/bin/bash

cd build
dpkg-buildpackage -b --no-sign >/dev/null 2>&1

cd /var/lib/dpkg/info

/usr/bin/shbr-echo -c /etc/shbr-echo/cpp/configs/static_config.yaml --config_vars /etc/shbr-echo/cpp/configs/config_vars.yaml