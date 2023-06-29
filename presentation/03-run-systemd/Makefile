.EXPORT_ALL_VARIABLES:

IMAGE = cr.yandex/crpo6t63ueuf0jf6tm5a/03-run-systemd
DOCKER_BUILDKIT = 1
BUILDKIT_PROGRESS = plain

docker-build:
	docker build . --platform linux/amd64 -t $$IMAGE:latest -t $$IMAGE

docker-run:
	docker run -d --rm --platform linux/amd64 \
	-v 03-package-systemd:/shbr-echo/cpp/build_release:rw \
	-v 03-package-systemd-gradle:/home/shbr/.gradle:rw \
	--privileged -u root --name 03-run-systemd $$IMAGE:latest /sbin/init

docker-push:
	docker push $$IMAGE:latest

docker-shell:
	docker exec -u shbr -it 03-run-systemd /usr/bin/fish
