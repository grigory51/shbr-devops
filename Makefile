build:
	make -C projects docker-build && make -C projects docker-push && \
	make -C presentation/01-package-deb docker-build && make -C presentation/01-package-deb docker-push && \
	make -C presentation/01-package-docker docker-build && make -C presentation/01-package-docker docker-push
