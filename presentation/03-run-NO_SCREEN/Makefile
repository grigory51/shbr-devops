.EXPORT_ALL_VARIABLES:

IMAGE = cr.yandex/crpo6t63ueuf0jf6tm5a/03-run-no_screen
DOCKER_BUILDKIT = 1
BUILDKIT_PROGRESS = plain

docker-build:
	docker build . --platform linux/amd64 -t $$IMAGE:latest -t $$IMAGE

docker-run:
	docker run -it -d --rm --platform linux/amd64 --name 03-run-no_screen $$IMAGE:latest

docker-shell:
	docker exec -it 03-run-no_screen /usr/bin/fish

docker-push:
	docker push $$IMAGE:latest
