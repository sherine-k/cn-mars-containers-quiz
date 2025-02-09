#!/bin/bash

########################
# include the magic
########################
. bin/demo-magic.sh

# hide the evidence
clear

# Pre-requisites: skopeo, jq, oras, sunny-tech-containers-quiz GH repo

# QUESTION 3

#p "Q3. Les images au format Docker et celles au format OCI sont-elles identiques ?"

cd q3

p 'skopeo copy docker://registry.access.redhat.com/ubi9/ubi-micro:9.3-15 dir:///tmp/ubi-micro9315-dv2'
cat skopeo_copy_ubimicro_dv2.txt

cp -r ubi-micro9315-dv2 /tmp

p 'skopeo copy docker://registry.access.redhat.com/ubi9/ubi-micro:9.3-15 oci:///tmp/ubi-micro9315-oci'
cat skopeo_copy_ubimicro_oci.txt

cp -r ubi-micro9315-oci /tmp

pe 'tree /tmp/ubi-micro9315-dv2'

pe 'tree /tmp/ubi-micro9315-oci'

pe 'cat /tmp/ubi-micro9315-dv2/manifest.json | jq'

pe 'cat /tmp/ubi-micro9315-oci/index.json | jq'

pe 'cat /tmp/ubi-micro9315-oci/blobs/sha256/9fbffcdf4defed7649d256a8ed4ff9d2df18c5f80b19ded9e4e3d45430874a04 | jq'

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

p 'oras push --plain-http localhost:5000/hello-artifact:v1 --artifact-type application/vnd.acme.rocket.config llm.txt:text/plain'
cat oras_push.txt

p 'skopeo inspect docker://localhost:5000/hello-artifact:v1 --tls-verify=false --raw | jq'
cat skopeo_inspect_hello.txt
# Fin Q3
cd ..
rm -fr /tmp/ubi-micro9315-dv2
rm -fr /tmp/ubi-micro9315-oci
