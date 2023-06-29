.EXPORT_ALL_VARIABLES:

IMAGE = cr.yandex/crpo6t63ueuf0jf6tm5a/06-gitlab
DOCKER_BUILDKIT = 1
BUILDKIT_PROGRESS = plain

docker-build:
	docker build . -t $$IMAGE:latest -t $$IMAGE

docker-run:
	docker run $(FLAGS) -it $$IMAGE:latest

docker-push:
	docker push $$IMAGE