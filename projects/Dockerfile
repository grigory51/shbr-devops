FROM ubuntu:jammy-20230605

ENV TERM=xterm-256color
ENV LANG=en_US.UTF-8
ENV LC_TYPE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8

RUN sed -i 's/archive.ubuntu.com/mirror.yandex.ru/g' /etc/apt/sources.list && \
    sed -i 's/security.ubuntu.com/mirror.yandex.ru/g' /etc/apt/sources.list && \
    apt-get update \
    && DEBIAN_FRONTEND="noninteractive" apt-get install -y locales fish vim curl git \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/* \
    && rm -rf /var/log/apt\
    && rm -rf /root/.cache

RUN sed -i 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen \
    && locale-gen \
    && update-locale\
    && DEBIAN_FRONTEND="noninteractive" dpkg-reconfigure locales

WORKDIR /shbr-echo

COPY java /shbr-echo/java
COPY python /shbr-echo/python
COPY go /shbr-echo/go
RUN git clone https://github.com/grigory51/shbr-devops-cpp.git cpp && cd cpp && git submodule update --init

ENTRYPOINT ["/usr/bin/fish"]