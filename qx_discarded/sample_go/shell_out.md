╭─╼skhoury@sherinefedora ~/.../q9/sample_go 
╰─ (main)-$ ko build . 
2024/12/23 12:06:27 Using base cgr.dev/chainguard/static:latest@sha256:f5fe67ab41c65f55766d824a2d857a7f56c9058b8e077c43d4d809c467f28df8 for github.com/sherine-k/tnt-containers-quiz/q9/sample_go
2024/12/23 12:06:27 git doesn't contain any tags. Tag info will not be available
git is in a dirty state
Please check in your pipeline what can be changing the following files:
 M q7.sh
?? ko
?? ko.tar.gz
?? multiple.intoto.jsonl
?? q9.sh
?? q9/

2024/12/23 12:06:27 Building github.com/sherine-k/tnt-containers-quiz/q9/sample_go for linux/amd64
2024/12/23 12:06:31 Publishing 79352h8v.c1.de1.container-registry.ovh.net/public/sample_go-a8c977420365ada034d95e4cf9b1ffda:latest
2024/12/23 12:06:34 pushed blob: sha256:df9655f455e64bfca70acf47da8b2d7305a042dd7245c6ea0107cf465f0a5ceb
2024/12/23 12:06:34 pushed blob: sha256:9d331c4342daeee7d5946ae0f829e05321513097ca6b91193c57038b0e7057fe
2024/12/23 12:06:35 pushed blob: sha256:7a1752f716f6636fd93de5637244ae62fb39694abab210ba53dcb81436ee4a76
2024/12/23 12:06:35 pushed blob: sha256:250c06f7c38e52dc77e5c7586c3e40280dc7ff9bb9007c396e06d96736cf8542
2024/12/23 12:06:35 pushed blob: sha256:95ef0e52520506faa1f04155ab5915bdc6a27df1171597095ecbe75915ef9d49
2024/12/23 12:06:35 79352h8v.c1.de1.container-registry.ovh.net/public/sample_go-a8c977420365ada034d95e4cf9b1ffda:sha256-f4c006c7a5066312dc58f99e0ac3cfbe807e4d9b10395ac947b302f198905ca4.sbom: digest: sha256:4d4973438f5226bdebce580f587cf38e6d62ecf543ea9a67fe873723a2bc2bfd size: 374
2024/12/23 12:06:35 Published SBOM 79352h8v.c1.de1.container-registry.ovh.net/public/sample_go-a8c977420365ada034d95e4cf9b1ffda:sha256-f4c006c7a5066312dc58f99e0ac3cfbe807e4d9b10395ac947b302f198905ca4.sbom
2024/12/23 12:06:37 pushed blob: sha256:cecd0f5f14ffbc8d3e6fb46f03987d5633a85b3b366bd68bb24ae278ef2553e7
2024/12/23 12:06:38 79352h8v.c1.de1.container-registry.ovh.net/public/sample_go-a8c977420365ada034d95e4cf9b1ffda:latest: digest: sha256:f4c006c7a5066312dc58f99e0ac3cfbe807e4d9b10395ac947b302f198905ca4 size: 1336
2024/12/23 12:06:38 Published 79352h8v.c1.de1.container-registry.ovh.net/public/sample_go-a8c977420365ada034d95e4cf9b1ffda@sha256:f4c006c7a5066312dc58f99e0ac3cfbe807e4d9b10395ac947b302f198905ca4
79352h8v.c1.de1.container-registry.ovh.net/public/sample_go-a8c977420365ada034d95e4cf9b1ffda@sha256:f4c006c7a5066312dc58f99e0ac3cfbe807e4d9b10395ac947b302f198905ca4
╭─╼skhoury@sherinefedora ~/.../q9/sample_go 
╰─ (main)-$ ll
total 12
-rw-r--r-- 1 skhoury skhoury  426 Dec 23 12:05 go.mod
-rw-r--r-- 1 skhoury skhoury 1316 Dec 23 12:05 go.sum
-rw-r--r-- 1 skhoury skhoury 3549 Dec 23 12:05 main.go

╭─╼skhoury@sherinefedora ~/.../q9/sample_go 
╰─ (main)-$ skopeo copy docker://79352h8v.c1.de1.container-registry.ovh.net/public/sample_go-a8c977420365ada034d95e4cf9b1ffda@sha256:f4c006c7a5066312dc58f99e0ac3cfbe807e4d9b10395ac947b302f198905ca4 oci:///tmp/go-sample
Getting image source signatures
Copying blob cecd0f5f14ff done   | 
Copying blob 95ef0e525205 done   | 
Copying blob 250c06f7c38e done   | 
Copying config 7a1752f716 done   | 
Writing manifest to image destination

╭─╼skhoury@sherinefedora ~/.../q9/sample_go 
╰─ (main)-$ skopeo copy 9352h8v.c1.de1.container-registry.ovh.net/public/sample_go-a8c977420365ada034d95e4cf9b1ffda@sha256:4d4973438f5226bdebce580f587cf38e6d62ecf543ea9a67fe873723a2bc2bfd oci:///tmp/go-sample-sbom
FATA[0000] Invalid source name 9352h8v.c1.de1.container-registry.ovh.net/public/sample_go-a8c977420365ada034d95e4cf9b1ffda@sha256:4d4973438f5226bdebce580f587cf38e6d62ecf543ea9a67fe873723a2bc2bfd: Invalid image name "9352h8v.c1.de1.container-registry.ovh.net/public/sample_go-a8c977420365ada034d95e4cf9b1ffda@sha256:4d4973438f5226bdebce580f587cf38e6d62ecf543ea9a67fe873723a2bc2bfd", unknown transport "9352h8v.c1.de1.container-registry.ovh.net/public/sample_go-a8c977420365ada034d95e4cf9b1ffda@sha256" 
╭─╼skhoury@sherinefedora ~/.../q9/sample_go 
╰─ (main)-$ skopeo copy docker://79352h8v.c1.de1.container-registry.ovh.net/public/sample_go-a8c977420365ada034d95e4cf9b1ffda@sha256:4d4973438f5226bdebce580f587cf38e6d62ecf543ea9a67fe873723a2bc2bfd oci:///tmp/go-sample-sbom
Getting image source signatures
Copying blob 9d331c4342da done   | 
Copying config df9655f455 done   | 
Writing manifest to image destination
╭─╼skhoury@sherinefedora ~/.../q9/sample_go 
╰─ (main)-$ cd /tmp/go-sample-sbom
╭─╼skhoury@sherinefedora /tmp/go-sample-sbom 
╰─ -$ less index.json 
╭─╼skhoury@sherinefedora /tmp/go-sample-sbom 
╰─ -$ cat index.json 
{"schemaVersion":2,"manifests":[{"mediaType":"application/vnd.oci.image.manifest.v1+json","digest":"sha256:4d4973438f5226bdebce580f587cf38e6d62ecf543ea9a67fe873723a2bc2bfd","size":374}]}╭─╼skhoury@sherinefedora /tmp/go-sample-sbom 
╰─ -$ cd blobs/sha256/
╭─╼skhoury@sherinefedora .../blobs/sha256 
╰─ -$ cd 4d4973438f5226bdebce580f587cf38e6d62ecf543ea9a67fe873723a2bc2bfd
bash: cd: 4d4973438f5226bdebce580f587cf38e6d62ecf543ea9a67fe873723a2bc2bfd: Not a directory
╭─╼skhoury@sherinefedora .../blobs/sha256 
╰─ -$ ls
4d4973438f5226bdebce580f587cf38e6d62ecf543ea9a67fe873723a2bc2bfd  df9655f455e64bfca70acf47da8b2d7305a042dd7245c6ea0107cf465f0a5ceb
9d331c4342daeee7d5946ae0f829e05321513097ca6b91193c57038b0e7057fe
╭─╼skhoury@sherinefedora .../blobs/sha256 
╰─ -$ more 4d4973438f5226bdebce580f587cf38e6d62ecf543ea9a67fe873723a2bc2bfd 
{"schemaVersion":2,"mediaType":"application/vnd.oci.image.manifest.v1+json","config":{"mediaType":"application/vnd.oci.image.config.v1+json","size":233,"diges
t":"sha256:df9655f455e64bfca70acf47da8b2d7305a042dd7245c6ea0107cf465f0a5ceb"},"layers":[{"mediaType":"text/spdx+json","size":11212,"digest":"sha256:9d331c4342
daeee7d5946ae0f829e05321513097ca6b91193c57038b0e7057fe"}]}
╭─╼skhoury@sherinefedora .../blobs/sha256 
╰─ -$ jq 9d331c4342daeee7d5946ae0f829e05321513097ca6b91193c57038b0e7057fe
jq: error: syntax error, unexpected IDENT, expecting end of file (Unix shell quoting issues?) at <top-level>, line 1:
9d331c4342daeee7d5946ae0f829e05321513097ca6b91193c57038b0e7057fe 
jq: 1 compile error
╭─╼skhoury@sherinefedora .../blobs/sha256 
╰─ -$ jq 9d331c4342daeee7d5946ae0f829e05321513097ca6b91193c57038b0e7057feca^C
╭─╼skhoury@sherinefedora .../blobs/sha256 
╰─ -$ cat 9d331c4342daeee7d5946ae0f829e05321513097ca6b91193c57038b0e7057fe
{
  "SPDXID": "SPDXRef-DOCUMENT",
  "name": "sbom-sha256:f4c006c7a5066312dc58f99e0ac3cfbe807e4d9b10395ac947b302f198905ca4",
  "spdxVersion": "SPDX-2.3",
  "creationInfo": {
    "created": "2024-11-12T12:01:47Z",
    "creators": [
      "Tool: ko 0.17.1"
    ]
  },
  "dataLicense": "CC0-1.0",
  "documentNamespace": "http://spdx.org/spdxdocs/ko/sha256:f4c006c7a5066312dc58f99e0ac3cfbe807e4d9b10395ac947b302f198905ca4",
  "documentDescribes": [
    "SPDXRef-Package-sha256-f4c006c7a5066312dc58f99e0ac3cfbe807e4d9b10395ac947b302f198905ca4"
  ],
  "packages": [
    {
      "SPDXID": "SPDXRef-Package-sha256-f4c006c7a5066312dc58f99e0ac3cfbe807e4d9b10395ac947b302f198905ca4",
      "name": "sha256:f4c006c7a5066312dc58f99e0ac3cfbe807e4d9b10395ac947b302f198905ca4",
      "filesAnalyzed": false,
      "licenseDeclared": "NOASSERTION",
      "licenseConcluded": "NOASSERTION",
      "downloadLocation": "NOASSERTION",
      "copyrightText": "NOASSERTION",
      "primaryPackagePurpose": "CONTAINER",
      "externalRefs": [
        {
          "referenceCategory": "PACKAGE-MANAGER",
          "referenceLocator": "pkg:oci/image@sha256:f4c006c7a5066312dc58f99e0ac3cfbe807e4d9b10395ac947b302f198905ca4?mediaType=application%2Fvnd.oci.image.manifest.v1%2Bjson",
          "referenceType": "purl"
        }
      ]
    },
    {
      "SPDXID": "SPDXRef-Package-sha256-decda8381dbd8765d4827218b79910355cde86a29a8b2bc7357b02a8f77f63dc",
      "name": "cgr.dev/chainguard/static@sha256:decda8381dbd8765d4827218b79910355cde86a29a8b2bc7357b02a8f77f63dc",
      "versionInfo": "cgr.dev/chainguard/static:latest",
      "filesAnalyzed": false,
      "licenseDeclared": "NOASSERTION",
      "licenseConcluded": "NOASSERTION",
      "downloadLocation": "NOASSERTION",
      "copyrightText": "NOASSERTION",
      "checksums": [
        {
          "algorithm": "SHA256",
          "checksumValue": "decda8381dbd8765d4827218b79910355cde86a29a8b2bc7357b02a8f77f63dc"
        }
      ],
      "externalRefs": [
        {
          "referenceCategory": "PACKAGE-MANAGER",
          "referenceLocator": "pkg:oci/image@sha256:decda8381dbd8765d4827218b79910355cde86a29a8b2bc7357b02a8f77f63dc?repository_url=cgr.dev%2Fchainguard%2Fstatic\u0026tag=latest",
          "referenceType": "purl"
        }
      ]
    },
    {
      "SPDXID": "SPDXRef-Package-github.com.sherine-k.tnt-containers-quiz.q9.sample_go-(devel)",
      "name": "github.com/sherine-k/tnt-containers-quiz/q9/sample_go",
      "filesAnalyzed": false,
      "licenseDeclared": "NOASSERTION",
      "licenseConcluded": "NOASSERTION",
      "downloadLocation": "https://github.com/sherine-k/tnt-containers-quiz/q9/sample_go",
      "copyrightText": "NOASSERTION",
      "externalRefs": [
        {
          "referenceCategory": "PACKAGE-MANAGER",
          "referenceLocator": "pkg:golang/github.com/sherine-k/tnt-containers-quiz/q9/sample_go@(devel)?type=module",
          "referenceType": "purl"
        }
      ]
    },
    {
      "SPDXID": "SPDXRef-Package-github.com.VividCortex.ewma-v1.2.0",
      "name": "github.com/VividCortex/ewma",
      "versionInfo": "v1.2.0",
      "filesAnalyzed": false,
      "licenseDeclared": "NOASSERTION",
      "licenseConcluded": "NOASSERTION",
      "downloadLocation": "https://proxy.golang.org/github.com/VividCortex/ewma/@v/v1.2.0.zip",
      "copyrightText": "NOASSERTION",
      "checksums": [
        {
          "algorithm": "SHA256",
          "checksumValue": "7f9f12688cdc0d7ad2cb791668736fb89809dcd9b3e7d6638ba5e8251fead68c"
        }
      ],
      "externalRefs": [
        {
          "referenceCategory": "PACKAGE-MANAGER",
          "referenceLocator": "pkg:golang/github.com/vividcortex/ewma@v1.2.0?type=module",
          "referenceType": "purl"
        }
      ]
    },
    {
      "SPDXID": "SPDXRef-Package-github.com.acarl005.stripansi-v0.0.0-20180116102854-5a71ef0e047d",
      "name": "github.com/acarl005/stripansi",
      "versionInfo": "v0.0.0-20180116102854-5a71ef0e047d",
      "filesAnalyzed": false,
      "licenseDeclared": "NOASSERTION",
      "licenseConcluded": "NOASSERTION",
      "downloadLocation": "https://proxy.golang.org/github.com/acarl005/stripansi/@v/v0.0.0-20180116102854-5a71ef0e047d.zip",
      "copyrightText": "NOASSERTION",
      "checksums": [
        {
          "algorithm": "SHA256",
          "checksumValue": "962719245c36470a4732a78a4c26248adb0fa873714e677848d479afde0518cf"
        }
      ],
      "externalRefs": [
        {
          "referenceCategory": "PACKAGE-MANAGER",
          "referenceLocator": "pkg:golang/github.com/acarl005/stripansi@v0.0.0-20180116102854-5a71ef0e047d?type=module",
          "referenceType": "purl"
        }
      ]
    },
    {
      "SPDXID": "SPDXRef-Package-github.com.mattn.go-runewidth-v0.0.16",
      "name": "github.com/mattn/go-runewidth",
      "versionInfo": "v0.0.16",
      "filesAnalyzed": false,
      "licenseDeclared": "NOASSERTION",
      "licenseConcluded": "NOASSERTION",
      "downloadLocation": "https://proxy.golang.org/github.com/mattn/go-runewidth/@v/v0.0.16.zip",
      "copyrightText": "NOASSERTION",
      "checksums": [
        {
          "algorithm": "SHA256",
          "checksumValue": "13949c34cb62c2f96f079a5a305770f69e24490cdb5c58a42794903ba4d42d07"
        }
      ],
      "externalRefs": [
        {
          "referenceCategory": "PACKAGE-MANAGER",
          "referenceLocator": "pkg:golang/github.com/mattn/go-runewidth@v0.0.16?type=module",
          "referenceType": "purl"
        }
      ]
    },
    {
      "SPDXID": "SPDXRef-Package-github.com.rivo.uniseg-v0.4.7",
      "name": "github.com/rivo/uniseg",
      "versionInfo": "v0.4.7",
      "filesAnalyzed": false,
      "licenseDeclared": "NOASSERTION",
      "licenseConcluded": "NOASSERTION",
      "downloadLocation": "https://proxy.golang.org/github.com/rivo/uniseg/@v/v0.4.7.zip",
      "copyrightText": "NOASSERTION",
      "checksums": [
        {
          "algorithm": "SHA256",
          "checksumValue": "59476f916f2e121ad87cb0b8673769236cedc4fd48e7cdbee3d39ce4cabae154"
        }
      ],
      "externalRefs": [
        {
          "referenceCategory": "PACKAGE-MANAGER",
          "referenceLocator": "pkg:golang/github.com/rivo/uniseg@v0.4.7?type=module",
          "referenceType": "purl"
        }
      ]
    },
    {
      "SPDXID": "SPDXRef-Package-github.com.vbauerster.mpb.v8-v8.8.3",
      "name": "github.com/vbauerster/mpb/v8",
      "versionInfo": "v8.8.3",
      "filesAnalyzed": false,
      "licenseDeclared": "NOASSERTION",
      "licenseConcluded": "NOASSERTION",
      "downloadLocation": "https://proxy.golang.org/github.com/vbauerster/mpb/v8/@v/v8.8.3.zip",
      "copyrightText": "NOASSERTION",
      "checksums": [
        {
          "algorithm": "SHA256",
          "checksumValue": "753381c86a2ac1a4c960fb9b855cf794ee4ee8c2b9e775d5814a37dcb76736c4"
        }
      ],
      "externalRefs": [
        {
          "referenceCategory": "PACKAGE-MANAGER",
          "referenceLocator": "pkg:golang/github.com/vbauerster/mpb/v8@v8.8.3?type=module",
          "referenceType": "purl"
        }
      ]
    },
    {
      "SPDXID": "SPDXRef-Package-golang.org.x.sync-v0.10.0",
      "name": "golang.org/x/sync",
      "versionInfo": "v0.10.0",
      "filesAnalyzed": false,
      "licenseDeclared": "NOASSERTION",
      "licenseConcluded": "NOASSERTION",
      "downloadLocation": "https://proxy.golang.org/golang.org/x/sync/@v/v0.10.0.zip",
      "copyrightText": "NOASSERTION",
      "checksums": [
        {
          "algorithm": "SHA256",
          "checksumValue": "dcd42b8c38b18e01b050e09a17cc36f95607bf455efef19849b7644daf7c8264"
        }
      ],
      "externalRefs": [
        {
          "referenceCategory": "PACKAGE-MANAGER",
          "referenceLocator": "pkg:golang/golang.org/x/sync@v0.10.0?type=module",
          "referenceType": "purl"
        }
      ]
    },
    {
      "SPDXID": "SPDXRef-Package-golang.org.x.sys-v0.24.0",
      "name": "golang.org/x/sys",
      "versionInfo": "v0.24.0",
      "filesAnalyzed": false,
      "licenseDeclared": "NOASSERTION",
      "licenseConcluded": "NOASSERTION",
      "downloadLocation": "https://proxy.golang.org/golang.org/x/sys/@v/v0.24.0.zip",
      "copyrightText": "NOASSERTION",
      "checksums": [
        {
          "algorithm": "SHA256",
          "checksumValue": "4f08e2c2af5d9fa4757d073288afb04321d67dacff04907e608a7353f0afdd78"
        }
      ],
      "externalRefs": [
        {
          "referenceCategory": "PACKAGE-MANAGER",
          "referenceLocator": "pkg:golang/golang.org/x/sys@v0.24.0?type=module",
          "referenceType": "purl"
        }
      ]
    }
  ],
  "relationships": [
    {
      "spdxElementId": "SPDXRef-DOCUMENT",
      "relationshipType": "DESCRIBES",
      "relatedSpdxElement": "SPDXRef-Package-sha256-f4c006c7a5066312dc58f99e0ac3cfbe807e4d9b10395ac947b302f198905ca4"
    },
    {
      "spdxElementId": "SPDXRef-Package-sha256-f4c006c7a5066312dc58f99e0ac3cfbe807e4d9b10395ac947b302f198905ca4",
      "relationshipType": "DESCENDANT_OF",
      "relatedSpdxElement": "SPDXRef-Package-sha256-decda8381dbd8765d4827218b79910355cde86a29a8b2bc7357b02a8f77f63dc"
    },
    {
      "spdxElementId": "SPDXRef-Package-sha256-f4c006c7a5066312dc58f99e0ac3cfbe807e4d9b10395ac947b302f198905ca4",
      "relationshipType": "CONTAINS",
      "relatedSpdxElement": "SPDXRef-Package-github.com.sherine-k.tnt-containers-quiz.q9.sample_go-(devel)"
    },
    {
      "spdxElementId": "SPDXRef-Package-github.com.sherine-k.tnt-containers-quiz.q9.sample_go-(devel)",
      "relationshipType": "DEPENDS_ON",
      "relatedSpdxElement": "SPDXRef-Package-github.com.VividCortex.ewma-v1.2.0"
    },
    {
      "spdxElementId": "SPDXRef-Package-github.com.sherine-k.tnt-containers-quiz.q9.sample_go-(devel)",
      "relationshipType": "DEPENDS_ON",
      "relatedSpdxElement": "SPDXRef-Package-github.com.acarl005.stripansi-v0.0.0-20180116102854-5a71ef0e047d"
    },
    {
      "spdxElementId": "SPDXRef-Package-github.com.sherine-k.tnt-containers-quiz.q9.sample_go-(devel)",
      "relationshipType": "DEPENDS_ON",
      "relatedSpdxElement": "SPDXRef-Package-github.com.mattn.go-runewidth-v0.0.16"
    },
    {
      "spdxElementId": "SPDXRef-Package-github.com.sherine-k.tnt-containers-quiz.q9.sample_go-(devel)",
      "relationshipType": "DEPENDS_ON",
      "relatedSpdxElement": "SPDXRef-Package-github.com.rivo.uniseg-v0.4.7"
    },
    {
      "spdxElementId": "SPDXRef-Package-github.com.sherine-k.tnt-containers-quiz.q9.sample_go-(devel)",
      "relationshipType": "DEPENDS_ON",
      "relatedSpdxElement": "SPDXRef-Package-github.com.vbauerster.mpb.v8-v8.8.3"
    },
    {
      "spdxElementId": "SPDXRef-Package-github.com.sherine-k.tnt-containers-quiz.q9.sample_go-(devel)",
      "relationshipType": "DEPENDS_ON",
      "relatedSpdxElement": "SPDXRef-Package-golang.org.x.sync-v0.10.0"
    },
    {
      "spdxElementId": "SPDXRef-Package-github.com.sherine-k.tnt-containers-quiz.q9.sample_go-(devel)",
      "relationshipType": "DEPENDS_ON",
      "relatedSpdxElement": "SPDXRef-Package-golang.org.x.sys-v0.24.0"
    }
  ]
}
╭─╼skhoury@sherinefedora .../blobs/sha256 
╰─ -$ cd ../../../go-sample
╭─╼skhoury@sherinefedora /tmp/go-sample 
╰─ -$ ls
blobs  index.json  oci-layout
╭─╼skhoury@sherinefedora /tmp/go-sample 
╰─ -$ cat index.json 
{"schemaVersion":2,"manifests":[{"mediaType":"application/vnd.oci.image.manifest.v1+json","digest":"sha256:f4c006c7a5066312dc58f99e0ac3cfbe807e4d9b10395ac947b302f198905ca4","size":1336}]}╭─╼skhoury@sherinefedora /tmp/go-sample 
╰─ -$ cd blobs/sha256/
╭─╼skhoury@sherinefedora .../blobs/sha256 
╰─ -$ more f4c006c7a5066312dc58f99e0ac3cfbe807e4d9b10395ac947b302f198905ca4 
{"schemaVersion":2,"mediaType":"application/vnd.oci.image.manifest.v1+json","config":{"mediaType":"application/vnd.oci.image.config.v1+json","size":1520,"dige
st":"sha256:7a1752f716f6636fd93de5637244ae62fb39694abab210ba53dcb81436ee4a76"},"layers":[{"mediaType":"application/vnd.oci.image.layer.v1.tar+gzip","size":474
054,"digest":"sha256:95ef0e52520506faa1f04155ab5915bdc6a27df1171597095ecbe75915ef9d49"},{"mediaType":"application/vnd.oci.image.layer.v1.tar+gzip","size":127,
"digest":"sha256:250c06f7c38e52dc77e5c7586c3e40280dc7ff9bb9007c396e06d96736cf8542"},{"mediaType":"application/vnd.oci.image.layer.v1.tar+gzip","size":2120430,
"digest":"sha256:cecd0f5f14ffbc8d3e6fb46f03987d5633a85b3b366bd68bb24ae278ef2553e7"}],"annotations":{"dev.chainguard.package.main":"","org.opencontainers.image
.authors":"Chainguard Team https://www.chainguard.dev/","org.opencontainers.image.base.digest":"sha256:decda8381dbd8765d4827218b79910355cde86a29a8b2bc7357b02a
8f77f63dc","org.opencontainers.image.base.name":"cgr.dev/chainguard/static:latest","org.opencontainers.image.created":"2024-11-12T12:01:47Z","org.opencontaine
rs.image.source":"https://github.com/chainguard-images/images/tree/main/images/static","org.opencontainers.image.url":"https://images.chainguard.dev/directory
/image/static/overview","org.opencontainers.image.vendor":"Chainguard"}}

╭─╼skhoury@sherinefedora ~/Downloads 
╰─ -$ sudo systemctl start docker
╭─╼skhoury@sherinefedora ~/Downloads 
╰─ -$ pack build buildpack_test_image --path ~/go/src/github.com/sherine-k/tnt-containers-quiz/q9/sample_go/ --builder  gcr.io/buildpacks/builder:google-22 
google-22: Pulling from buildpacks/builder
7478e0ac0f23: Pulling fs layer 
5ce17dcc9ac8: Pulling fs layer 
cce376298b43: Pulling fs layer 
b6751e60d6f3: Waiting 
357fefdf9bc9: Waiting 
8416fcb4dc1e: Waiting 
7660eda2497a: Waiting 
dda916f62ece: Waiting 
ee0633863d6d: Waiting 
e538b15c912a: Waiting 
fb8ddc234b8b: Waiting 
7d0936a13c40: Waiting 
dff4ff31af26: Waiting 
1364bd345f75: Waiting 
7784d9f95b0a: Waiting 
218351108d58: Waiting 
d69c9bd73d26: Waiting 
806ecf54412f: Waiting 
8367ea6ea358: Waiting 
36091d4fcf83: Waiting 
efd8843cb6f3: Waiting 
682eb4f3ce94: Waiting 
be6f73f404ca: Waiting 
ed3ce0735604: Waiting 
6753801b1064: Pull complete 
a780f3aafe6c: Pull complete 
6f887dd8cf4a: Pull complete 
216e415d523c: Pull complete 
dd579dc1410a: Pull complete 
10dc07b05a53: Pull complete 
f18cdd2cea26: Pull complete 
0819a7defe50: Pull complete 
7994db1b3843: Pull complete 
a69395c06b87: Pull complete 
2e4b8e0a90d9: Pull complete 
cda63268fe4c: Pull complete 
ff7ae286a275: Pull complete 
8c30ed8db750: Pull complete 
0450e1d15d2f: Pull complete 
7fd9dbd8072f: Pull complete 
07dbcf191ec8: Pull complete 
46786a13575b: Pull complete 
c4b6cec9f562: Pull complete 
7035f3278514: Pull complete 
bc6f54238462: Pull complete 
2131a4400785: Pull complete 
14ec2b9dbaac: Pull complete 
58d38f678305: Pull complete 
f1577b8effb9: Pull complete 
8dcd00ba4882: Pull complete 
c8b02cb4df16: Pull complete 
c529a2786898: Pull complete 
a6e151544747: Pull complete 
1eb8709ffe67: Pull complete 
f8cd74e3f454: Pull complete 
327a7c843995: Pull complete 
4f4fb700ef54: Pull complete 
Digest: sha256:37994f81eb08a7bbfa001089225dc8eb420b045c8dc7f07b0642f4153feaab5e
Status: Downloaded newer image for gcr.io/buildpacks/builder:google-22
latest: Pulling from buildpacks/google-22/run
7478e0ac0f23: Already exists 
6c06d7d0b56f: Pull complete 
19fdbb2bb252: Pull complete 
e34b80fd50e3: Pull complete 
Digest: sha256:ae53f161d98258ef762237d6c8d23c479e01bfb646272a7e1d211a0f3854c213
Status: Downloaded newer image for gcr.io/buildpacks/google-22/run:latest
===> ANALYZING
Timer: Analyzer started at 2024-12-23T13:57:15Z
Image with name "buildpack_test_image" not found
Timer: Analyzer ran for 37.428µs and ended at 2024-12-23T13:57:15Z
===> DETECTING
Timer: Detector started at 2024-12-23T13:57:15Z
4 of 6 buildpacks participating
google.go.runtime        0.9.1
google.go.gomod          0.9.0
google.go.build          0.9.0
google.utils.label-image 0.0.2
Timer: Detector ran for 18.596955ms and ended at 2024-12-23T13:57:15Z
===> RESTORING
Timer: Restorer started at 2024-12-23T13:57:15Z
Timer: Restorer ran for 387.596µs and ended at 2024-12-23T13:57:15Z
===> BUILDING
Timer: Builder started at 2024-12-23T13:57:15Z
=== Go - Runtime (google.go.runtime@0.9.1) ===
Using latest stable Go version
2024/12/23 13:57:15 [DEBUG] GET https://go.dev/dl/?mode=json
***** CACHE MISS: "go"
Installing Go v1.23.4.
2024/12/23 13:57:16 [DEBUG] GET https://dl.google.com/go/go1.23.4.linux-amd64.tar.gz
=== Go - Gomod (google.go.gomod@0.9.0) ===
***** CACHE MISS: "gopath"
--------------------------------------------------------------------------------
Running "go mod download (GOPATH=/layers/google.go.gomod/gopath GO111MODULE=on GOPROXY=https://proxy.golang.org|direct)"
Done "go mod download (GOPATH=/layers/google.go.gomod/gopath GO111..." (617.395176ms)
=== Go - Build (google.go.build@0.9.0) ===
--------------------------------------------------------------------------------
Running "go list -f {{if eq .Name \"main\"}}{{.Dir}}{{end}} ./..."
/workspace
Done "go list -f {{if eq .Name \"main\"}}{{.Dir}}{{end}} ./..." (83.560936ms)
--------------------------------------------------------------------------------
Running "go build -o /layers/google.go.build/bin/main ./. (GOCACHE=/layers/google.go.build/gocache)"
Done "go build -o /layers/google.go.build/bin/main ./. (GOCACHE=/l..." (4.718046374s)
=== Utils - Label Image (google.utils.label-image@0.0.2) ===
Timer: Builder ran for 9.614492684s and ended at 2024-12-23T13:57:25Z
===> EXPORTING
no run metadata found at path '/cnb/run.toml'
Timer: Exporter started at 2024-12-23T13:57:25Z
Adding layer 'google.go.build:bin'
Adding layer 'buildpacksio/lifecycle:launch.sbom'
Adding 1/1 app layer(s)
Adding layer 'buildpacksio/lifecycle:launcher'
Adding layer 'buildpacksio/lifecycle:config'
Adding layer 'buildpacksio/lifecycle:process-types'
Adding label 'io.buildpacks.lifecycle.metadata'
Adding label 'io.buildpacks.build.metadata'
Adding label 'io.buildpacks.project.metadata'
Setting default process type 'web'
Timer: Saving buildpack_test_image... started at 2024-12-23T13:57:25Z
*** Images (b15684cbbfdc):
      buildpack_test_image
Timer: Saving buildpack_test_image... ran for 116.704256ms and ended at 2024-12-23T13:57:25Z
Timer: Exporter ran for 307.761911ms and ended at 2024-12-23T13:57:25Z
Timer: Cache started at 2024-12-23T13:57:25Z
Adding cache layer 'google.go.runtime:go'
Adding cache layer 'google.go.gomod:gopath'
Timer: Cache ran for 1.643116875s and ended at 2024-12-23T13:57:27Z
Successfully built image buildpack_test_image
