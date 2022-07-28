FROM cr.yandex/crpamim8dasm0u97qtpf/shbr-01-package-docker:latest

RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y supervisor curl iproute2
RUN apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/* \
    && rm -rf /var/log/apt\
    && rm -rf /root/.cache

ADD shbr.conf /etc/supervisor/conf.d

EXPOSE 10000
CMD ["supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]