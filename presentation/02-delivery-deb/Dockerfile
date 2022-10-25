FROM cr.yandex/crpamim8dasm0u97qtpf/shbr-01-package-deb:latest as builder

# Пересборка пакета
USER shbr
RUN cd /shbr-echo/build && dpkg-buildpackage -b --no-sign

FROM cr.yandex/crpamim8dasm0u97qtpf/shbr-01-package-deb:latest

# установка пакетов для ключей
USER root
RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y gpg apt-utils
RUN apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/* \
    && rm -rf /var/log/apt\
    && rm -rf /root/.cache

USER shbr
COPY --from=builder /shbr-echo/shbr-echo_1.0.0-1_amd64.deb /shbr-echo

# репозиторий
WORKDIR /usr/local/www/debs
ADD Release .
ADD hint.sh .
RUN sudo chown -R shbr:shbr /usr/local/www/debs
RUN sudo chmod -R 755 /shbr-echo
RUN mkdir jammy
