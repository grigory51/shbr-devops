FROM cr.yandex/crp5udmc090nv4rpkk6c/shbr-01-package-deb

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

# предсборка пакета
USER shbr
RUN cd /shbr-echo/build && dpkg-buildpackage -b --no-sign

# репозиторий
WORKDIR /usr/local/www/debs
ADD Release .
RUN sudo chown -R shbr:shbr /usr/local/www/debs
RUN sudo chmod -R 755 /shbr-echo
RUN mkdir focal

ENTRYPOINT ["/bin/bash"]