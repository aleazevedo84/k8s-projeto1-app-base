#!/bin/bash

echo "Criando as imagens:"

docker build -t alezevedo84/projeto-backend:1.0 backend/.
docker build -t alezevedo84/projeto-database:1.0 database/.

echo "Realizando o push das imagens:"

docker push -t alezevedo84/projeto-backend:1.0 
docker push -t alezevedo84/projeto-database:1.0 

echo "Criado servio no cluster kubernetes:"

kubectl apply -f ./services.yml

echo "Criando os deployments:"
kubectl apply -f ./deployment.yml


