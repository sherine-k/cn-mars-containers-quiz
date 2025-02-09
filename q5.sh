#!/bin/bash

########################
# include the magic
########################
. bin/demo-magic.sh

# hide the evidence
clear

# Pre-requisites: podman, login quay.io, sunny-tech-containers-quiz GH repo

# QUESTION 5

#p "Q5. Quand je supprime un répertoire de mon Dockerfile: \`RUN rm -r /helm\`"
pe 'tree q5'
pe 'cat q5/Containerfile'

pe 'podman build q5 -t myhelm:v0.1'
mkdir -p /tmp/myhelm-v01/

pe 'podman save myhelm:v0.1 --format docker-dir -o /tmp/myhelm-v01/'

pe 'cd /tmp/myhelm-v01/'
pe 'tree .' 
pe 'for i in `ls`; do echo "tar tvf $i"; tar tvf $i  2> /dev/null | grep helm; echo ============; done'

pe 'crane export quay.io/skhoury/myhelm:v0.1 /tmp/myhelm_extracted'
pe 'tar tvf /tmp/myhelm_extracted | grep helm'
#pe 'tar tvf /tmp/myhelm_extracted'

cd -

rm -fr /tmp/myhelm-v01/
rm -fr /tmp/myhelm_extracted
# Fin Q5

p "Fini !"
