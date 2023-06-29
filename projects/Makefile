.EXPORT_ALL_VARIABLES:

IMAGE = cr.yandex/crpo6t63ueuf0jf6tm5a/projects
DOCKER_BUILDKIT = 1
BUILDKIT_PROGRESS = plain

docker-build:
	docker build . --platform linux/amd64 -t $$IMAGE:latest -t $$IMAGE

docker-run:
	docker run -it $$IMAGE:latest

docker-push:
	docker push $$IMAGE:latest
