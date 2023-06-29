.EXPORT_ALL_VARIABLES:

IMAGE = cr.yandex/crpo6t63ueuf0jf6tm5a/02-delivery-deb
DOCKER_BUILDKIT = 1
BUILDKIT_PROGRESS = plain

docker-build:
	docker build . --platform linux/amd64 -t $$IMAGE:latest -t $$IMAGE

docker-run:
	docker run --rm --name 02-delivery-deb --platform linux/amd64 -it $$IMAGE:latest /usr/bin/fish

docker-shell:
	docker exec -it 02-delivery-deb /usr/bin/fish

docker-push:
	docker push $$IMAGE:latest