FROM cr.yandex/crpo6t63ueuf0jf6tm5a/01-package-docker:latest

RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install -y curl net-tools iproute2 && \
    apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/* \
    && rm -rf /var/log/apt\
    && rm -rf /root/.cache

EXPOSE 10000
CMD ["/bin/tail", "-f", "/dev/null"]