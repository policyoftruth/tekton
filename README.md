## **Tekton Expiriments / WSL2**

### **References**
* <https://tekton.dev/docs/>
* <https://github.com/tektoncd/cli>
* <https://minikube.sigs.k8s.io/docs/>

### **Prereqs**
* `kubectl` and the Tekton CLI, `tkn` are in the `inst_k8s_tools.sh` script
* Minikube
```
curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
```

## **Commands**
* `kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml`
* `kubectl apply --filename https://storage.googleapis.com/tekton-releases/dashboard/latest/release.yaml`
  * Use `kubectl proxy` to access the dashboard
* `curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64`
