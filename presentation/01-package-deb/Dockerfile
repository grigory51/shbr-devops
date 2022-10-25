FROM cr.yandex/crpamim8dasm0u97qtpf/shbr-projects:latest

# установка базовых пакетов
RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y vim \
                                                        tree \
                                                        man-db \
                                                        sudo \
                                                        net-tools \
                                                        software-properties-common \
                                                        python3 python3-pip python3-dev python3-virtualenv

# установка пакетов для сборки CPP
# https://github.com/userver-framework/userver/blob/develop/scripts/docs/en/deps/ubuntu-22.04.md
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y  cmake \
                                                        libboost1.74-dev \
                                                        libboost-program-options1.74-dev \
                                                        libboost-filesystem1.74-dev \
                                                        libboost-locale1.74-dev \
                                                        libboost-regex1.74-dev \
                                                        libboost-iostreams1.74-dev \
                                                        libev-dev \
                                                        zlib1g-dev \
                                                        libcurl4-openssl-dev \
                                                        libcrypto++-dev \
                                                        libyaml-cpp-dev \
                                                        libssl-dev \
                                                        libfmt-dev \
                                                        libcctz-dev \
                                                        libhttp-parser-dev \
                                                        libjemalloc-dev \
                                                        python3-jinja2 \
                                                        python3-voluptuous \
                                                        libc-ares-dev \
                                                        libspdlog-dev \
                                                        libbenchmark-dev \
                                                        libgmock-dev \
                                                        libgtest-dev \
                                                        ccache \
                                                        git

RUN pip3 install pyyaml

# установка пакетов для сборки Java
RUN add-apt-repository ppa:linuxuprising/java
RUN apt-get update
RUN /bin/echo debconf shared/accepted-oracle-license-v1-3 select true | /usr/bin/debconf-set-selections
RUN /bin/echo debconf shared/accepted-oracle-license-v1-3 seen true | /usr/bin/debconf-set-selections
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y oracle-java17-installer

# установка пакетов для запуска Python
RUN pip3 install aiohttp

# Установка пакетов для сборки deb
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y debhelper build-essential

# Чистка от работы apt
RUN apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/* \
    && rm -rf /var/log/apt\
    && rm -rf /root/.cache

# root без пароля для всех из группы sudo
RUN sed -i  's/%sudo\tALL=(ALL:ALL) ALL/%sudo\tALL=(ALL:ALL) NOPASSWD:ALL/g' /etc/sudoers

# создаем пользователя shbr и добавляем его в группу sudo
RUN useradd -m -s /usr/bin/fish shbr
RUN usermod -a -G sudo shbr
USER shbr

# наш проект
ADD build /shbr-echo/build
ADD hint.sh /shbr-echo
RUN sudo chown -R shbr:shbr /shbr-echo
RUN sudo chmod -R 755 /shbr-echo

WORKDIR /shbr-echo