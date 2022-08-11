docker-build:
	docker build -t cr.yandex/crpamim8dasm0u97qtpf/shbr-03-run-no_nohup:latest .

docker-run:
	docker run -d -it --name shbr-03-run-no_nohup cr.yandex/crpamim8dasm0u97qtpf/shbr-03-run-no_nohup:latest

docker-shell:
	docker exec -it shbr-03-run-no_nohup /bin/bash

docker-kill:
	docker kill shbr-03-run-no_nohup && docker rm shbr-03-run-no_nohup

docker-push:
	docker push cr.yandex/crpamim8dasm0u97qtpf/shbr-03-run-no_nohup:latest
