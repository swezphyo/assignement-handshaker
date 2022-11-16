#!/bin/bash
# Simple bash file to list out the installation of required dependencies

#install docker
sudo apt install docker.io

#install go 
sudo apt install golang-go

#check go version installed
go version

#install KINd
go install sigs.k8s.io/kind@v0.17.0

#check docker status
systemctl status docker

#create cluster
kind create cluster --config=multinodes.yaml

#Apply the ingress 
kubectl apply -f deploy_ingress.yaml

#deploy nginx ingress controller
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
