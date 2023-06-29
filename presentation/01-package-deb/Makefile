.EXPORT_ALL_VARIABLES:

IMAGE = cr.yandex/crpo6t63ueuf0jf6tm5a/01-package-deb
DOCKER_BUILDKIT = 1
BUILDKIT_PROGRESS = plain

docker-build:
	docker build . --platform linux/amd64 -t $$IMAGE:latest -t $$IMAGE

docker-run:
	docker run --rm --name 01-package-deb -v 01-package-deb:/shbr-echo/cpp/build_release:rw --platform linux/amd64 -it $$IMAGE:latest

docker-push:
	docker push $$IMAGE:latest
