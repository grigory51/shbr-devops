.EXPORT_ALL_VARIABLES:

IMAGE = cr.yandex/crpamim8dasm0u97qtpf/shbr-03-run-docker
DOCKER_BUILDKIT = 1
BUILDKIT_PROGRESS = plain

docker-build:
	docker build . --build-arg BUILDKIT_INLINE_CACHE=1 --cache-from=$$IMAGE:latest -t $$IMAGE:latest -t $$IMAGE

docker-run:
	docker run -e LANG=cpp -e PREFIX="Hello, " -d --name shbr-03-run-docker -p 10000:10000 $$IMAGE:latest

docker-push:
	docker push $$IMAGE:latest