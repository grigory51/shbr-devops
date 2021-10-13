FROM cr.yandex/crp5udmc090nv4rpkk6c/shbr-projects:latest

# установка базовых пакетов
RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y vim tree man-db sudo net-tools software-properties-common

# установка JDK
RUN add-apt-repository ppa:linuxuprising/java
RUN apt-get update
RUN /bin/echo debconf shared/accepted-oracle-license-v1-2 select true | /usr/bin/debconf-set-selections
RUN /bin/echo debconf shared/accepted-oracle-license-v1-2 seen true | /usr/bin/debconf-set-selections
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y oracle-java16-installer

# установка Python 3 и aiohttp
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y python3 python3-pip
RUN pip3 install aiohttp

RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y debhelper build-essential
RUN apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/* \
    && rm -rf /var/log/apt\
    && rm -rf /root/.cache

# root без пароля для всех из группы sudo
RUN sed -i  's/%sudo\tALL=(ALL:ALL) ALL/%sudo\tALL=(ALL:ALL) NOPASSWD:ALL/g' /etc/sudoers

# создаем пользователя shbr и добавляем его в группу sudo
RUN useradd -m -s /bin/bash shbr
RUN usermod -a -G sudo shbr
USER shbr

# наш проект
ADD build /shbr-echo/build
RUN sudo chown -R shbr:shbr /shbr-echo
RUN sudo chmod -R 755 /shbr-echo
WORKDIR /shbr-echo

ENTRYPOINT ["/bin/bash"]