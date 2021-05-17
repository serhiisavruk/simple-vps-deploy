**Authorize into GitHub container registry**
`USERNAME=username PASSWORD=personal-access-token EMAIL=test@example.com k8s/bin/create-registry-secret.sh`
helm registry login -u zlangobelz https://ghcr.io

**To remove secret use command**
`kubectl delete secret ghcr-secret`

**Port forward:**

`kubectl port-forward {POD} {HOST_PORT}:{CLUSTER_PORT}`