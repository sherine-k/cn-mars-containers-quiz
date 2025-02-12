#!/bin/bash

########################
# include the magic
########################
. bin/demo-magic.sh

# hide the evidence
clear

# Pre-requisites: podman, jq, sunny-tech-containers-quiz GH repo

# QUESTION 5

#p "Q5. Quand je pull une image multi-arch par digest, quel est le digest local ?"

pe 'skopeo inspect docker://registry.access.redhat.com/ubi9/ubi-micro@sha256:8e33df2832f039b4b1adc53efd783f9404449994b46ae321ee4a0bf4499d5c42 | jq .Digest'

pe 'skopeo inspect docker://registry.access.redhat.com/ubi9/ubi-micro@sha256:8e33df2832f039b4b1adc53efd783f9404449994b46ae321ee4a0bf4499d5c42 | jq .Architecture' 

pe 'podman pull registry.access.redhat.com/ubi9/ubi-micro@sha256:8e33df2832f039b4b1adc53efd783f9404449994b46ae321ee4a0bf4499d5c42'

pe 'jq . $HOME/.local/share/containers/storage/overlay-images/0a76a9bf80abadb332376f659186555601fe7d9d26979cf01d6441a8133e1af1/manifest'

pe 'sha256sum $HOME/.local/share/containers/storage/overlay-images/0a76a9bf80abadb332376f659186555601fe7d9d26979cf01d6441a8133e1af1/manifest'

p 'Il me semblait avoir demandé 8e33df2832f039b4b1adc53efd783f9404449994b46ae321ee4a0bf4499d5c42!!!'

pe 'skopeo copy docker://registry.access.redhat.com/ubi9/ubi-micro@sha256:8e33df2832f039b4b1adc53efd783f9404449994b46ae321ee4a0bf4499d5c42 --all dir:///tmp/ubi-micro-dv2-all'

pe 'ls /tmp/ubi-micro-dv2-all'

pe 'jq . /tmp/ubi-micro-dv2-all/manifest.json'

pe 'sha256sum /tmp/ubi-micro-dv2-all/manifest.json'
p "c'est bien 8e33df2832f039b4b1adc53efd783f9404449994b46ae321ee4a0bf4499d5c42!!"

rm -fr /tmp/ubi-micro-dv2-all
# Fin Q5
