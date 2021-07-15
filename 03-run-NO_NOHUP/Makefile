docker-build:
	docker build -t cr.yandex/crp5udmc090nv4rpkk6c/shbr-03-run-no_nohup:latest .

docker-run:
	docker run -it --name shbr-03-run-no_nohup cr.yandex/crp5udmc090nv4rpkk6c/shbr-03-run-no_nohup:latest

docker-shell:
	docker exec -it shbr-03-run-no_nohup /bin/bash

docker-kill:
	docker kill shbr-03-run-no_nohup && docker rm shbr-03-run-no_nohup

docker-push:
	docker push cr.yandex/crp5udmc090nv4rpkk6c/shbr-03-run-no_nohup:latest