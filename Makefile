build-projects:
	make -C projects docker-build && make -C projects docker-push

build: build-projects
	make -C presentation/01-package-deb docker-build && make -C presentation/01-package-deb docker-push && \
	make -C presentation/01-package-docker docker-build && make -C presentation/01-package-docker docker-push && \
	make -C presentation/02-delivery-deb docker-build && make -C presentation/02-delivery-deb docker-push && \
	make -C presentation/02-delivery-docker docker-build && \
	make -C presentation/03-run-docker docker-build && make -C presentation/03-run-docker docker-push && \
	make -C presentation/03-run-NO_NOHUP docker-build && make -C presentation/03-run-NO_NOHUP docker-push && \
	make -C presentation/03-run-NO_SCREEN docker-build && make -C presentation/03-run-NO_SCREEN docker-push
