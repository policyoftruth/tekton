#!/usr/bin/env bash

### set your tooling versions by checking the commented links on each tool
### you will need to manually fetch the checksum values or remove that logic
### run with sudo if you want to move the bin outside of your /home

set -e

FS_TARGET='/usr/local/bin'
K3D_VER='5.7.3'
K3D_SUM='0fe23b8c0a151e9c41d16f9d861be26df65e5ab7f35115424220aad5a83c566b'          # https://github.com/k3d-io/k3d/releases/
KUBECTL_VER='1.32.3'
KUBECTL_SUM='ab209d0c5134b61486a0486585604a616a5bb2fc07df46d304b3c95817b2d79f'      # https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-kubectl-binary-with-curl-on-linux
KUSTOMIZE_VER='5.4.2'
KUSTOMIZE_SUM='881c6e9007c7ea2b9ecc214d13f4cdd1f837635dcf4db49ce4479898f7d911a3'    # https://github.com/kubernetes-sigs/kustomize/releases
HELM_VER='3.15.4'
HELM_SUM='11400fecfc07fd6f034863e4e0c4c4445594673fd2a129e701fe41f31170cfa9'         # https://github.com/helm/helm/releases
TKN_VER='0.40.0'
TKN_SUM='98cf4fa939b0ad391074f9ad72188197cb50f2e8efa8f3fbbff5815094998354'

### k3d | https://github.com/k3d-io/k3d?tab=readme-ov-file#releases
wget -q -O - https://github.com/k3d-io/k3d/releases/download/v${K3D_VER}/k3d-linux-amd64 > ./k3d
echo ${K3D_SUM} k3d | sha256sum -c | grep OK
if [ $? == 0 ]; then chmod +x k3d && mv ./k3d ${FS_TARGET}; fi

### kubectl | https://kubernetes.io/releases/ (tracks with k8s versions)
wget -q -O - https://dl.k8s.io/release/v${KUBECTL_VER}/bin/linux/amd64/kubectl > ./kubectl
echo ${KUBECTL_SUM} kubectl | sha256sum -c | grep OK
if [ $? == 0 ]; then chmod +x kubectl && mv ./kubectl ${FS_TARGET}; fi

### kustomize | https://github.com/kubernetes-sigs/kustomize/releases/
wget -q -O - https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VER}/kustomize_v${KUSTOMIZE_VER}_linux_amd64.tar.gz > ./kustomize.tar.gz
echo ${KUSTOMIZE_SUM} kustomize.tar.gz | sha256sum -c | grep OK
if [ $? == 0 ]; then tar -xvf kustomize.tar.gz > /dev/null 2>&1 && chmod +x ./kustomize && mv ./kustomize ${FS_TARGET} && rm kustomize.tar.gz ; fi  

### helm | https://github.com/helm/helm/releases/
wget -q -O - https://get.helm.sh/helm-v${HELM_VER}-linux-amd64.tar.gz > ./helm.tar.gz
echo ${HELM_SUM} helm.tar.gz | sha256sum -c | grep OK
if [ $? == 0 ]; then tar -xvf helm.tar.gz > /dev/null 2>&1 && chmod +x linux-amd64/helm && mv ./linux-amd64/helm ${FS_TARGET} && rm -rf linux-amd64 && rm helm.tar.gz ; fi  

### tkn cli | https://github.com/tektoncd/cli/
wget -q -O - https://github.com/tektoncd/cli/releases/download/v${TKN_VER}/tkn_${TKN_VER}_Linux_x86_64.tar.gz > ./tkn.tar.gz
echo ${TKN_SUM} tkn.tar.gz | sha256sum -c | grep OK
if [ $? == 0 ]; then tar -xvf tkn.tar.gz > /dev/null 2>&1 && chmod +x ./tkn && mv ./tkn ${FS_TARGET} && rm -rf LICENSE && rm tkn.tar.gz ; fi  
