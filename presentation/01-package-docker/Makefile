.EXPORT_ALL_VARIABLES:

IMAGE = cr.yandex/crpo6t63ueuf0jf6tm5a/01-package-docker
DOCKER_BUILDKIT = 1
BUILDKIT_PROGRESS = plain

docker-build:
	docker build . --platform linux/amd64 -t $$IMAGE:latest -t $$IMAGE

docker-run:
	docker run --rm --name 01-package-docker --platform linux/amd64 -p 10000:10000 -e LANG=java -it $$IMAGE:latest

docker-run-shell:
	docker run --rm --name 01-package-docker -it $$IMAGE:latest /usr/bin/fish

docker-push:
	docker push $$IMAGE:latest
