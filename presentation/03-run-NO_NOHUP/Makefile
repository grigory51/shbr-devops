.EXPORT_ALL_VARIABLES:

IMAGE = cr.yandex/crpo6t63ueuf0jf6tm5a/03-run-no_nohup
DOCKER_BUILDKIT = 1
BUILDKIT_PROGRESS = plain

docker-build:
	docker build . -t $$IMAGE:latest -t $$IMAGE

docker-run:
	docker run -d -it --name shbr-03-run-no_nohup $$IMAGE:latest

docker-shell:
	docker exec -it shbr-03-run-no_nohup /usr/bin/fish

docker-kill:
	docker kill shbr-03-run-no_nohup && docker rm shbr-03-run-no_nohup

docker-push:
	docker push $$IMAGE:latest
