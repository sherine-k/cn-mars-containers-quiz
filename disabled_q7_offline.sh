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

p 'skopeo inspect docker://registry.access.redhat.com/ubi9/ubi-micro@sha256:8e33df2832f039b4b1adc53efd783f9404449994b46ae321ee4a0bf4499d5c42 | jq .Digest'
echo "sha256:8e33df2832f039b4b1adc53efd783f9404449994b46ae321ee4a0bf4499d5c42"

p 'skopeo inspect docker://registry.access.redhat.com/ubi9/ubi-micro@sha256:8e33df2832f039b4b1adc53efd783f9404449994b46ae321ee4a0bf4499d5c42 | jq .Architecture'
echo "amd64"

p 'podman pull registry.access.redhat.com/ubi9/ubi-micro@sha256:8e33df2832f039b4b1adc53efd783f9404449994b46ae321ee4a0bf4499d5c42'
cat q5/podman-pull.txt

p 'jq . $HOME/.local/share/containers/storage/overlay-images/0a76a9bf80abadb332376f659186555601fe7d9d26979cf01d6441a8133e1af1/manifest'
jq . q3/ubi-micro9315-dv2/manifest.json

p 'sha256sum $HOME/.local/share/containers/storage/overlay-images/0a76a9bf80abadb332376f659186555601fe7d9d26979cf01d6441a8133e1af1/manifest'
sha256sum q3/ubi-micro9315-dv2/manifest.json

p 'Il me semblait avoir demandé 8e33df2832f039b4b1adc53efd783f9404449994b46ae321ee4a0bf4499d5c42!!!'

p 'skopeo copy docker://registry.access.redhat.com/ubi9/ubi-micro@sha256:8e33df2832f039b4b1adc53efd783f9404449994b46ae321ee4a0bf4499d5c42 --all dir:///tmp/ubi-micro-dv2-all'
cat q5/skopeo-copy-all.txt

p 'ls /tmp/ubi-micro-dv2-all'
cat q5/ls-dv2-all.txt

p 'jq . /tmp/ubi-micro-dv2-all/manifest.json'
jq . q5/manifest-full.json

p 'sha256sum /tmp/ubi-micro-dv2-all/manifest.json'
sha256sum q5/manifest-full.json

p "c'est bien 8e33df2832f039b4b1adc53efd783f9404449994b46ae321ee4a0bf4499d5c42!!"

p "Fini !"
# Fin Q5
