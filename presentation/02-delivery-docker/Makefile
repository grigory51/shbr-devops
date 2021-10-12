docker-build:
	docker build -t localhost:5000/shbr-02-delivery-docker:latest .

docker-push-local:
	docker push localhost:5000/shbr-02-delivery-docker:latest

# registry
docker-build-registry:
	docker build -t registry:local -f Dockerfile.registry .

docker-run-registry:
	docker run -v $$(pwd)/.registry:/var/lib/registry -p 5000:5000 --name registry registry:local

docker-shell-registry:
	docker exec -it registry /bin/bash