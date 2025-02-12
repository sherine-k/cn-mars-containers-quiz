#!/bin/bash

########################
# include the magic
########################
. bin/demo-magic.sh

# hide the evidence
clear

# Pre-requisites: skopeo, jq, oras, sunny-tech-containers-quiz GH repo

# QUESTION 3

cd q3

cp -r ubi-micro9315-dv2 /tmp

cp -r ubi-micro9315-oci /tmp

p 'Differences des structures de fichiers'
pe 'tree /tmp/ubi-micro9315-dv2 # Docker'
pe 'tree /tmp/ubi-micro9315-oci # OCI'

p 'Difference des manifests'
pe 'cat /tmp/ubi-micro9315-dv2/manifest.json | jq # Docker'
pe 'cat /tmp/ubi-micro9315-oci/index.json | jq # OCI Index'

pe 'cat /tmp/ubi-micro9315-oci/blobs/sha256/9fbffcdf4defed7649d256a8ed4ff9d2df18c5f80b19ded9e4e3d45430874a04 | jq # OCI Manifest'

pe 'diff <(jq -S . /tmp/ubi-micro9315-oci/blobs/sha256/9fbffcdf4defed7649d256a8ed4ff9d2df18c5f80b19ded9e4e3d45430874a04) <(jq -S . /tmp/ubi-micro9315-dv2/manifest.json)'

pe 'cat helm-oci/blobs/sha256/b745d1324bc4b1b774bb11445e98cfb8cdd5b75288c1efc1f20515365880f688 | jq'

p 'podman registry start'
cat registry_start.txt

p 'helm push mychart-0.1.0.tgz oci://localhost:5000/helm-charts'
echo "Pushed: localhost:5000/helm-charts/mychart:0.1.0"
PROMPT_TIMEOUT=1
wait
echo "Digest: sha256:ec5f08ee7be8b557cd1fc5ae1a0ac985e8538da7c93f51a51eff4b277509a723"

PROMPT_TIMEOUT=0
wait
pe 'echo toto > llm.txt'

p 'oras push --plain-http localhost:5000/hello-artifact:v1 --artifact-type application/vnd.sunny.tech.config llm.txt:text/plain'
cat oras_push.txt

p 'skopeo inspect docker://localhost:5000/hello-artifact:v1 --tls-verify=false --raw | jq'
cat skopeo_inspect_hello.txt

# Fin Q3
cd ..

rm -fr /tmp/ubi-micro9315-oci
rm -fr /tmp/ubi-micro9315-dv2

p "Fini !"
