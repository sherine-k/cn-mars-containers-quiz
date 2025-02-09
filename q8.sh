#!/bin/bash

########################
# include the magic
########################
. bin/demo-magic.sh

# hide the evidence
clear

# Pre-requisites: cosign, docker, jq, crane

# Remove all signatures from an image 
#cosign clean 79352h8v.c1.de1.container-registry.ovh.net/public/gophers-api -f

# QUESTION 8

#p "Q8. Avec Cosign, quand je signe une image, la signature est ... ?"

# generate key pair with cosign
p 'Génération de la clé privé et de la clé publique'
pe 'cosign generate-key-pair'

p "Il est conseillé de signer une image a partir de son digest et non de son tag"
p "Récupération du digest de l'image"
pe "docker inspect 79352h8v.c1.de1.container-registry.ovh.net/public/gophers-api | jq -r '.[0].RepoDigests[0]'"
IMG_DIGEST=$(docker inspect 79352h8v.c1.de1.container-registry.ovh.net/public/gophers-api | jq -r '.[0].RepoDigests[0]')

# sign the OCI artifact and push to the Managed Private Registry/Harbor instance and store the transparency log (metadata) in the public Rekor server"
# at https://rekor.sigstore.dev/ (to verify the signature afterward)
p "Signature de l'artefact OCI et push sur le private registry"
#(et sauvegarde du transparency log (metadata) sur le public Rekor server)
#pe 'cosign sign --key cosign.key 79352h8v.c1.de1.container-registry.ovh.net/public/gophers-api'
pe "cosign sign -y --key cosign.key $IMG_DIGEST"

p "Vérification de l'image signée avec cosign"
#pe 'cosign verify 79352h8v.c1.de1.container-registry.ovh.net/public/gophers-api --key cosign.pub -o text | jq'
pe "cosign verify $IMG_DIGEST --key cosign.pub -o text | jq"

p 'Vérification sur le OVHcloud private registry: 79352h8v.c1.de1.container-registry.ovh.net'
# Access to the registry, green check mark
# Click on the > icon that displays the associated cosign signature information
# Cosign créé une signature qui est attachée a l'image sous forme de metadata externe (comme un nouveau tag specifique), mais ne modifie pas l'image orignale ni ne créé une copie

# Le tag a la forme sha256-<digest>.sig pour s'assurer qu'il correspond a l'image d'origine
# La signature est un "accessory" d'une image et elle est associée a un nouveau tag
p 'Affichage du tag sous la forme sha256-<digest>.sig'
pe "cosign triangulate 79352h8v.c1.de1.container-registry.ovh.net/public/gophers-api"

p 'Inspection du manifest de ce tag special'
pe "crane manifest $(cosign triangulate 79352h8v.c1.de1.container-registry.ovh.net/public/gophers-api) | jq ."

# Ce n'est pas une image, on ne peut pas la puller
# $ docker pull 79352h8v.c1.de1.container-registry.ovh.net/public/gophers-api:sha256-b229a8c3a6b9fc5873c97e60636e58fa0cee8cec449104cf3fa2bfa6639f3833.sig
#sha256-b229a8c3a6b9fc5873c97e60636e58fa0cee8cec449104cf3fa2bfa6639f3833.sig: Pulling from public/gophers-api
#failed to unpack image on snapshotter overlayfs: mismatched image rootfs and manifest layers

p "Tips: On peut meme ajouter une annotation/information a notre signature"
pe "cosign sign -y -a conf=tnt --key cosign.key $IMG_DIGEST"

# Verify the image is signed with cosign
pe "cosign verify $IMG_DIGEST --key cosign.pub -o text | jq"

p "Fini !"

# Clean image privée et publique
rm cosign.key cosign.pub 

# Montrer que l'image n'est pas modifiée avant/apres ?
# docker pull de la signature pour voir quelle tronche ça a ?

# Verif sur le docker hub? ou montrer uniquement sur Harbor suffit ?
#p 'Vérification sur le Docker Hub: https://hub.docker.com/r/scraly/gophers-api/tags'

# Image reference 79352h8v.c1.de1.container-registry.ovh.net/public/gophers-api uses a tag, not a digest, to identify the image to sign.
#    This can lead you to sign a different image than the intended one. Please use a
#    digest (example.com/ubuntu@sha256:abc123...) rather than tag
#    (example.com/ubuntu:latest) for the input to cosign. The ability to refer to
#    images by tag will be removed in a future release.
