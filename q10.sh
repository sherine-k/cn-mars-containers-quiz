#!/bin/bash

########################
# include the magic
########################
. bin/demo-magic.sh

# hide the evidence
clear

# Pre-requisites: docker, sed

# QUESTION 10

cd gophers-api

p "Build d'une image"
pe 'docker build . -t gophers-api:friday -f Dockerfile-golang21'

pe 'docker image ls gophers-api'

p "Changement de golang 1.21 vers 1.20"
pe 'vi Dockerfile-golang21'

pe 'docker build . -t gophers-api:friday -f Dockerfile-golang21'

pe 'docker image ls gophers-api'

pe 'docker images -f dangling=true'

p "Suppression des dangling images, pour libérer de la place"
pe "docker rmi \$(docker images -f dangling=true -q)"

p "/!\ Docker only - Les dangling images n'existent pas avec containerd en image store"

#Revert Dockerfile-golang21 golang version
if [[ "$OSTYPE" != "darwin"* ]]; then
    sed -i 's/1.20/1.21/g' Dockerfile-golang21
else
    sed -i '' 's/1.20/1.21/g' Dockerfile-golang21
fi

cd ..
p "Fini !"
