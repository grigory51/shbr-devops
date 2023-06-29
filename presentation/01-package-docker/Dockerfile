FROM cr.yandex/crpo6t63ueuf0jf6tm5a/projects:latest as builder-python

FROM cr.yandex/crpo6t63ueuf0jf6tm5a/projects:latest as builder-go

WORKDIR /shbr-echo

RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y golang

RUN go build -o shbr-echo go/main.go

FROM cr.yandex/crpo6t63ueuf0jf6tm5a/projects:latest as builder-cpp

WORKDIR /shbr-echo

# Установка базовых пакетов
RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y vim \
                                                        tree \
                                                        man-db \
                                                        sudo \
                                                        net-tools \
                                                        software-properties-common \
                                                        python3 python3-pip python3-dev virtualenv && \
    # Установка пакетов для сборки CPP
    # https://github.com/userver-framework/userver/blob/develop/scripts/docs/en/deps/ubuntu-22.04.md
    DEBIAN_FRONTEND="noninteractive" apt-get install -y ccache \
                                                        cmake \
                                                        git \
                                                        libbenchmark-dev \
                                                        libboost-context1.74-dev \
                                                        libboost-coroutine1.74-dev \
                                                        libboost-filesystem1.74-dev \
                                                        libboost-iostreams1.74-dev \
                                                        libboost-locale1.74-dev \
                                                        libboost-program-options1.74-dev \
                                                        libboost-regex1.74-dev \
                                                        libboost1.74-dev \
                                                        libbson-dev \
                                                        libc-ares-dev \
                                                        libcctz-dev \
                                                        libcrypto++-dev \
                                                        libcurl4-openssl-dev \
                                                        libev-dev \
                                                        libfmt-dev \
                                                        libgmock-dev \
                                                        libgrpc++-dev \
                                                        libgrpc++1 \
                                                        libgrpc-dev \
                                                        libgtest-dev \
                                                        libhiredis-dev \
                                                        libhttp-parser-dev \
                                                        libjemalloc-dev \
                                                        libkrb5-dev \
                                                        libldap2-dev \
                                                        libmongoc-dev \
                                                        libnghttp2-dev \
                                                        libpq-dev \
                                                        libprotoc-dev \
                                                        libspdlog-dev \
                                                        libssl-dev \
                                                        libyaml-cpp-dev \
                                                        postgresql-14 \
                                                        postgresql-server-dev-14 \
                                                        protobuf-compiler-grpc \
                                                        python3-dev \
                                                        python3-jinja2 \
                                                        python3-protobuf \
                                                        python3-virtualenv \
                                                        python3-voluptuous \
                                                        redis-server \
                                                        zlib1g-dev

RUN pip3 install pyyaml

RUN make -C ./cpp build-release

FROM cr.yandex/crpo6t63ueuf0jf6tm5a/projects:latest as builder-java

WORKDIR /shbr-echo

# Установка базовых пакетов
RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y software-properties-common

## Установка JDK
RUN add-apt-repository ppa:linuxuprising/java
RUN apt-get update
RUN /bin/echo debconf shared/accepted-oracle-license-v1-3 select true | /usr/bin/debconf-set-selections
RUN /bin/echo debconf shared/accepted-oracle-license-v1-3 seen true | /usr/bin/debconf-set-selections
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y oracle-java17-installer

RUN java/gradlew bootJar -p ./java


FROM ubuntu:jammy-20230605
# установка базовых пакетов
RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y software-properties-common fish

# установка Python
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y python3 python3-pip
RUN pip3 install aiohttp

# установка библиотек для CPP
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y libjemalloc2 \
                                                        libboost-locale1.74 \
                                                        libboost-filesystem1.74.0 \
                                                        libboost-program-options1.74.0 \
                                                        libboost-iostreams1.74.0 \
                                                        libboost-regex1.74.0 \
                                                        libyaml-cpp0.7 \
                                                        libfmt8 \
                                                        libc-ares2 \
                                                        libcctz2 \
                                                        libcrypto++8 \
                                                        libhttp-parser2.9 \
                                                        libev4 \
                                                        libcurl4

# установка JDK
RUN add-apt-repository ppa:linuxuprising/java
RUN apt-get update
RUN /bin/echo debconf shared/accepted-oracle-license-v1-3 select true | /usr/bin/debconf-set-selections
RUN /bin/echo debconf shared/accepted-oracle-license-v1-3 seen true | /usr/bin/debconf-set-selections
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y oracle-java17-installer

RUN apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/* \
    && rm -rf /var/log/apt\
    && rm -rf /root/.cache

COPY --from=builder-go /shbr-echo/shbr-echo /shbr-echo-go

COPY --from=builder-python /shbr-echo/python/main.py /shbr-echo.py

COPY --from=builder-java /shbr-echo/java/build/libs/java-0.0.1-SNAPSHOT.jar /shbr-echo.jar

COPY --from=builder-cpp /shbr-echo/cpp/build_release/shbr_devops_cpp /shbr-echo-cpp
ADD etc/shbr-echo /etc/shbr-echo

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

EXPOSE 10000
ENV LANG=python
CMD ["/entrypoint.sh"]