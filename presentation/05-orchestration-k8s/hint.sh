#!/bin/bash

# запустить k8s
minikube start --driver=none

kubectl create namespace shbr
kubectl -n shbr apply -f deployment.yaml
kubectl -n shbr apply -f service.yaml
curl http://localhost:32000/hello
kubectl -n shbr get pods

