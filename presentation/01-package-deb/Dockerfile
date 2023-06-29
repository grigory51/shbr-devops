FROM cr.yandex/crpo6t63ueuf0jf6tm5a/projects:latest

RUN apt-get update && \
    # Установка базовых пакетов
    DEBIAN_FRONTEND="noninteractive" apt-get install -y vim \
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
                                                        zlib1g-dev && \
    pip install pyyaml && \
    # Установка пакетов для сборки Java
    add-apt-repository ppa:linuxuprising/java && apt-get update && \
    /bin/echo debconf shared/accepted-oracle-license-v1-3 select true | /usr/bin/debconf-set-selections && \
    /bin/echo debconf shared/accepted-oracle-license-v1-3 seen true | /usr/bin/debconf-set-selections && \
    DEBIAN_FRONTEND="noninteractive" apt-get install -y oracle-java17-installer && \
    # Установка пакетов для сборки go
    DEBIAN_FRONTEND="noninteractive" apt-get install -y golang && \
    # Установка пакетов для запуска Python
    pip3 install aiohttp && \
    # Установка пакетов для сборки deb
    DEBIAN_FRONTEND="noninteractive" apt-get install -y debhelper build-essential && \
    # Чистка от работы apt и pip
    apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/* \
    && rm -rf /var/log/apt\
    && rm -rf /root/.cache

# Отключаем сервисы, которые установились с зависимостями для СPP
RUN systemctl disable postgresql redis networkd-dispatcher polkit unattended-upgrades

# root без пароля для всех из группы sudo
RUN sed -i  's/%sudo\tALL=(ALL:ALL) ALL/%sudo\tALL=(ALL:ALL) NOPASSWD:ALL/g' /etc/sudoers

# Cоздаем пользователя shbr и добавляем его в группу sudo
RUN useradd -m -s /usr/bin/fish shbr
RUN usermod -a -G sudo shbr

USER shbr

# Предскачаем gradle
RUN ./java/gradlew wrapper -v

## Наш проект
ADD build /shbr-echo/build
ADD hint.sh /shbr-echo
ADD entrypoint.sh /entrypoint.sh

RUN sudo chown -R shbr:shbr /shbr-echo
RUN sudo chmod -R 755 /shbr-echo
RUN sudo chmod a+x /entrypoint.sh

WORKDIR /shbr-echo
ENTRYPOINT ["/entrypoint.sh"]