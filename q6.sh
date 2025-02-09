#!/bin/bash

########################
# include the magic
########################
. bin/demo-magic.sh

# hide the evidence
clear
if [[ "$OSTYPE" != "darwin"* ]]; then
  shopt -s expand_aliases
  source ~/.bashrc
fi

# Pre-requisites: docker, podman, gophers-api GH repo

# QUESTION 6

#p "Q6. L’image que je build fonctionne partout ?"
p "Créer un builder pour build multi-arch Docker images, et l'utiliser"
p 'docker buildx create --name mybuilder --bootstrap --use'

p 'Inspecter le builder'
pe 'docker buildx inspect mybuilder'

cd gophers-api
p "Builder pour amd64 & arm64 et pusher l'image directement sur le registry"
pe 'docker buildx build --push --platform linux/arm64/v8,linux/amd64  --builder mybuilder -t scraly/gophers-api:multi-arch .'

#It's not possible to push a multi-platform image to a docker engine.
#Instead all images in the engine are single platform, and you push the multi-platform image directly to the selected registry.
#You can pull the image to get the version for your platform:

cd
p "Pull de l'image en local (de notre plateforme)"
pe 'docker pull scraly/gophers-api:multi-arch'

pe 'docker image ls scraly/gophers-api:multi-arch'

p 'Afficher le manifest'
pe 'docker manifest inspect scraly/gophers-api:multi-arch'

p 'Vérification sur le registry: https://hub.docker.com/r/scraly/gophers-api/tags'

p "Fini !"
