docker-build:
	docker build -t cr.yandex/crpamim8dasm0u97qtpf/shbr-03-run-docker:latest .

docker-run:
	docker run -e LANG=java -e PREFIX="Hello, " -d --name shbr-03-run-docker -p 10000:10000 cr.yandex/crpamim8dasm0u97qtpf/shbr-03-run-docker:latest

docker-push:
	docker push cr.yandex/crpamim8dasm0u97qtpf/shbr-03-run-docker:latest