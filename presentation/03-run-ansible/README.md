# 03-run-ansible
Здесь — использование ansible локально, без похода по ssh.

## Чтобы заработало
1. Создаем virtualenv: `virtualenv env`
2. Активируем: `source env/bin/activate`
3. Ставим зависимости: `pip install -r requirements.txt`
4. Запускаем: `make play`

## Возможные проблемы

### Error connecting: Error while fetching server API version
По-умолчанию ansible пытается сходить в /var/run/docker.sock.
В свежей версии docker desktop сокет переехал в `$HOME/.docker/run/docker.sock`.

Поможем ansible найти сокет:
```bash
sudo ln -svf $HOME/.docker/run/docker.sock /var/run/docker.sock
```