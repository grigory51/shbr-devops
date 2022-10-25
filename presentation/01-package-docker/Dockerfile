FROM cr.yandex/crpamim8dasm0u97qtpf/shbr-projects:latest as builder-cpp

WORKDIR /shbr-echo

# установка базовых пакетов
RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y vim \
                                                        tree \
                                                        man-db \
                                                        sudo \
                                                        net-tools \
                                                        software-properties-common \
                                                        python3 python3-pip python3-dev virtualenv

# установка пакетов для сборки CPP
# https://github.com/userver-framework/userver/blob/develop/scripts/docs/en/deps/ubuntu-22.04.md
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y  cmake \
                                                         libboost1.67-dev \
                                                         libboost-program-options1.67-dev \
                                                         libboost-filesystem1.67-dev \
                                                         libboost-locale1.67-dev \
                                                         libboost-regex1.67-dev \
                                                         libboost-iostreams1.67-dev \
                                                         libev-dev \
                                                         zlib1g-dev \
                                                         libcurl4-openssl-dev \
                                                         libcrypto++-dev \
                                                         libyaml-cpp-dev \
                                                         libssl-dev \
                                                         libcctz-dev \
                                                         libhttp-parser-dev \
                                                         libjemalloc-dev \
                                                         python3-protobuf \
                                                         python3-jinja2 \
                                                         python3-voluptuous \
                                                         libbenchmark-dev \
                                                         libgtest-dev \
                                                         libgmock-dev \
                                                         ccache \
                                                         git
RUN pip3 install pyyaml

RUN make -C ./cpp build-release

FROM cr.yandex/crpamim8dasm0u97qtpf/shbr-projects:latest as builder-java

WORKDIR /shbr-echo

# установка базовых пакетов
RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y software-properties-common

## установка JDK
RUN add-apt-repository ppa:linuxuprising/java
RUN apt-get update
RUN /bin/echo debconf shared/accepted-oracle-license-v1-3 select true | /usr/bin/debconf-set-selections
RUN /bin/echo debconf shared/accepted-oracle-license-v1-3 seen true | /usr/bin/debconf-set-selections
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y oracle-java17-installer
RUN java/gradlew bootJar -p ./java


FROM ubuntu:focal
# установка базовых пакетов
RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y software-properties-common

# установка Python
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y python3 python3-pip
RUN pip3 install aiohttp

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

COPY --from=builder-java /shbr-echo/java/build/libs/java-0.0.1-SNAPSHOT.jar /shbr-echo.jar
COPY main.py /shbr-echo.py

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

EXPOSE 10000
ENV LANG=python
CMD ["/entrypoint.sh"]