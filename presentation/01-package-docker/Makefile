.EXPORT_ALL_VARIABLES:

IMAGE = cr.yandex/crpamim8dasm0u97qtpf/shbr-01-package-docker
DOCKER_BUILDKIT = 1
BUILDKIT_PROGRESS = plain

docker-build:
	docker build . --build-arg BUILDKIT_INLINE_CACHE=1 --cache-from=$$IMAGE:latest -t $$IMAGE:latest -t $$IMAGE

docker-run:
	docker run $(FLAGS) -it $$IMAGE:latest

docker-run-shell:
	docker run -it $$IMAGE:latest /usr/bin/fish

docker-push:
	docker push cr.yandex/crpamim8dasm0u97qtpf/shbr-01-package-docker:latest