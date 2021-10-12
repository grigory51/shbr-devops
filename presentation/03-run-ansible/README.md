Здесь — использование ansible локально, без похода по ssh.

Чтобы заработало:
1. Создаем virtualenv: `virtualenv env`
2. Активируем: `source env/bin/activate`
3. Ставим зависимости: `pip install -r requirements.txt`
4. Запускаем: `make play`