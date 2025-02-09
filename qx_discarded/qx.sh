
p 'Let'\''s use crane!'
pe 'cat lorem_ipsum.txt'
pe 'tar cvzf lorem_ipsum.tar.gz lorem_ipsum.txt'
p 'crane auth login -u sunnytech  79352h8v.c1.de1.container-registry.ovh.net'
crane auth login -u sunnytech -p SunnyTech2024 79352h8v.c1.de1.container-registry.ovh.net
pe 'crane append -b registry.redhat.io/ubi9/ubi-micro:latest -f lorem_ipsum.tar.gz -t  79352h8v.c1.de1.container-registry.ovh.net/public/lorem:crane'
pe 'podman run 79352h8v.c1.de1.container-registry.ovh.net/public/lorem:crane ls -l lorem_ipsum.txt'
rm lorem_ipsum.tar.gz

p 'Let'\''s try buildah!'
pe 'buildah from registry.redhat.io/ubi9/ubi:latest'
pe 'buildah add ubi-working-container lorem_ipsum.txt /tmp'
pe 'buildah commit ubi-working-container docker://79352h8v.c1.de1.container-registry.ovh.net/public/lorem:buildah'
pe 'podman run 79352h8v.c1.de1.container-registry.ovh.net/public/lorem:buildah ls -l /tmp/lorem_ipsum.txt'
buildah rm ubi-working-container


# skopeo copy docker://registry.redhat.io/ubi9/ubi-micro:latest docker://sherinefedora:5000/ubi9/ubi-micro:latest
# oras attach --artifact-type dev.cosignproject.cosign/signature sherinefedora:5000/ubi9/ubi-micro:latest signature:application/vnd.dev.cosign.simplesigning.v1+json
# # Uploading ee4128799e61 signature
# # Uploaded  ee4128799e61 signature
# # Attached to [registry] sherinefedora:5000/ubi9/ubi-micro@sha256:3313e52bb1aad4017a0c35f9f2ae35cf8526eeeb83f6ecbec449ba9c5cb9cb07
# # Digest: sha256:0210b5f0d75da9cd5eda61002c0bf5872ac588a7629d87e18635f8bd8d1df4a
# skopeo inspect docker://sherinefedora:5000/ubi9/ubi-micro:latest
# oras discover sherinefedora:5000/ubi9/ubi-micro:latest
# # Discovered 1 artifact referencing latest
# # Digest: sha256:3313e52bb1aad4017a0c35f9f2ae35cf8526eeeb83f6ecbec449ba9c5cb9cb07
# # 
# # Artifact Type                        Digest
# # dev.cosignproject.cosign/signature   sha256:0210b5f0d75da9cd5eda61002c0bf5872ac588a7629d87e18635f8bd8d1df4a0
