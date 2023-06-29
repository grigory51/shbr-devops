.EXPORT_ALL_VARIABLES:

IMAGE = cr.yandex/crpo6t63ueuf0jf6tm5a/03-run-docker
DOCKER_BUILDKIT = 1
BUILDKIT_PROGRESS = plain

docker-build:
	docker build . --platform linux/amd64 -t $$IMAGE:latest -t $$IMAGE

docker-run:
	docker run -e LANG=cpp -e PREFIX="Hello, " -d --name shbr-03-run-docker -p 10000:10000 $$IMAGE:latest

docker-push:
	docker push $$IMAGE:latest