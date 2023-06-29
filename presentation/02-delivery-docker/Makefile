docker-build:
	docker build . --platform linux/amd64 -t localhost:5001/02-delivery-docker:latest

docker-push-local:
	docker push localhost:5001/02-delivery-docker:latest

# registry
docker-build-registry:
	docker build -t registry:local -f Dockerfile.registry .

docker-run-registry:
	docker run --rm --name "02-delivery-docker:registry" -v 02-delivery-docker-registry:/var/lib/registry:rw -p 5001:5000 registry:local

docker-shell-registry:
	docker exec -it registry /bin/bash
