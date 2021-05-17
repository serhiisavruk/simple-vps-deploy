delete:
	helm delete -n default my-release

ls:
	helm list
	kubectl get pods

install:
	cd chart && helm dependency build

release:
	helm install -f chart/values.yaml my-release chart/

kube-delete:
	kubectl delete all --all

ep:
	kubectl get ep
