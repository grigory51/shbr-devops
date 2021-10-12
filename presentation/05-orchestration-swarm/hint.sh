#!/bin/bash

# Создать кластер
docker swarm init --advertise-addr 10.0.0.2

# Получить список нод в кластере
docker node ls

# Создать сервис
docker service create --replicas 3 --name shbr-echo cr.yandex/crp5udmc090nv4rpkk6c/shbr-01-package-docker:latest

# Список сервисов
docker service list

# Обновить сервис
docker service update --publish-add target=10000,published=10000 shbr-echo

# Масштабировать
docker service scale shbr-echo=2

# Докинуть переменную
docker service update --env-add PREFIX="World, " shbr-echo