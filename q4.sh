#!/bin/bash

########################
# include the magic
########################
. bin/demo-magic.sh

# hide the evidence
clear

# Pre-requisites: docker, podman, gophers-api GH repo

# QUESTION 4

#p "Q4. Que se passe-t'il quand je push une image dans un registry ?"
cd gophers-api

p 'docker login -u tnt 79352h8v.c1.de1.container-registry.ovh.net'
docker login -u sunnytech -p SunnyTech2024 79352h8v.c1.de1.container-registry.ovh.net
pe 'docker build -t 79352h8v.c1.de1.container-registry.ovh.net/public/gophers-api:latest .'
pe 'docker image ls 79352h8v.c1.de1.container-registry.ovh.net/public/gophers-api:latest'
pe 'docker push 79352h8v.c1.de1.container-registry.ovh.net/public/gophers-api:latest'
p 'Vérification sur le OVHcloud private registry: 79352h8v.c1.de1.container-registry.ovh.net'
# 22.6MB en local → 10.82MiB sur OVHcloud Managed Private Registry / Harbor ;-)
p 'Vérification sur le Docker Hub: https://hub.docker.com/r/scraly/gophers-api/tags'

# zstd conseillé pour les grosses images, IA !
p 'Tips avec Podman: on peut changer le mode de compression pendant le push'
p 'podman push docker.io/scraly/gophers-api:podman-zstd --compression-format=zstd'

p "Tips: on peut changer le mode de compression avec Docker aussi"
p "docker buildx build --output type=image,name=scraly/gophers-api:docker-zstd,oci-mediatypes=true,compression=zstd,compression-level=3,force-compression=true,push=true --push ."
p "docker manifest inspect -v scraly/gophers-api:docker-zstd | grep 'application/vnd.oci.image.layer.v1.tar+zstd'"
cat ../q4/gophers-api-docker-zstd-manifest.json | grep 'application/vnd.oci.image.layer.v1.tar+zstd'

cd
p "Fini !"
