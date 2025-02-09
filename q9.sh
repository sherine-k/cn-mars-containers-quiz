#!/bin/bash

########################
# include the magic
########################
. bin/demo-magic.sh

# hide the evidence
clear

cd q9

# Pre-requisites: docker scout, trivy, bom

# install trivy
# curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sudo sh -s -- -b /usr/local/bin v0.58.1

# install docker scout (no need if you have docker desktop)
#  curl -fsSL https://raw.githubusercontent.com/docker/scout-cli/main/install.sh -o install-scout.sh
#  sudo sh install-scout.sh

# install bom
# go install sigs.k8s.io/bom/cmd/bom@latest
podman login -u sunnytech -p SunnyTech2024 79352h8v.c1.de1.container-registry.ovh.net
oras login -u sunnytech -p SunnyTech2024 79352h8v.c1.de1.container-registry.ovh.net
p 'Générer un SBOM avec Trivy'
pe 'skopeo copy docker://registry.redhat.io/ubi9/ubi-micro:latest docker://79352h8v.c1.de1.container-registry.ovh.net/public/ubi9/ubi-micro:latest --remove-signatures'
pe 'trivy image --format spdx-json --output /tmp/result.json 79352h8v.c1.de1.container-registry.ovh.net/public/ubi9/ubi-micro:latest'

p 'Visualiser le spdx, avec bom'
pe 'bom document outline /tmp/result.json'

p 'Tips: on peut utiliser bom, docker et podman pour générer un SBOM'
p 'docker scout sbom ubuntu --output sbom.txt'
p 'podman build . -t myimage:mytag --sbom-scanner-command trivy --sbom-output sbom.txt'
p 'bom generate --image quay.io/skhoury/ubi9/ubi-micro:latest --output=sbom.json --format json'
pe 'bom document outline scout_sbom.json'
pe 'bom document outline bom_sbom.json'

# p '# Attachons le sbom à l''\image'
# pe 'oras attach 79352h8v.c1.de1.container-registry.ovh.net/public/ubi9/ubi-micro:latest --artifact-type application/spdx+json trivy_sbom.json:text/spdx+json'

# p '# Regardons la registry... https://79352h8v.c1.de1.container-registry.ovh.net/harbor/projects/2/repositories/ubi9%2Fubi-micro/artifacts-tab'

# pe 'oras discover 79352h8v.c1.de1.container-registry.ovh.net/public/ubi9/ubi-micro:latest'

# p 'oras discover sherinefedora:5000/ubi9/ubi-micro:latest'
# cat oras_discover_distrib.out

cd ..
p "Fini !"
