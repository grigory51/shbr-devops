FROM ubuntu:focal

# установка базовых пакетов
RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y vim tree man-db sudo net-tools
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y golang debhelper build-essential
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
ADD shbr-echo /shbr-echo
RUN sudo chown -R shbr:shbr /shbr-echo
RUN sudo chmod -R 755 /shbr-echo
WORKDIR /shbr-echo

ENTRYPOINT ["/bin/bash"]