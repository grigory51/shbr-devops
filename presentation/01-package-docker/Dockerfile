FROM cr.yandex/crp5udmc090nv4rpkk6c/shbr-projects:latest as builder
WORKDIR /shbr-echo

# установка базовых пакетов
RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y software-properties-common

# установка JDK
RUN add-apt-repository ppa:linuxuprising/java
RUN apt-get update
RUN /bin/echo debconf shared/accepted-oracle-license-v1-2 select true | /usr/bin/debconf-set-selections
RUN /bin/echo debconf shared/accepted-oracle-license-v1-2 seen true | /usr/bin/debconf-set-selections
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y oracle-java16-installer

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
RUN /bin/echo debconf shared/accepted-oracle-license-v1-2 select true | /usr/bin/debconf-set-selections
RUN /bin/echo debconf shared/accepted-oracle-license-v1-2 seen true | /usr/bin/debconf-set-selections
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y oracle-java16-installer

RUN apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/* \
    && rm -rf /var/log/apt\
    && rm -rf /root/.cache

COPY --from=builder /shbr-echo/java/build/libs/java-0.0.1-SNAPSHOT.jar /shbr-echo.jar
COPY --from=builder /shbr-echo/python/main.py /shbr-echo.py

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

EXPOSE 10000
CMD ["/entrypoint.sh"]