CLUSTER_NAME="kind-kubernetes-dev"
CLUSTER_VERSION="kindest/node:v1.19.11"
.DEFAULT_GOAL := help
.PHONY: help
help:  ## Show help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

start-kind-ingress:  ## Create kind
	@echo "## Start kind cluster ##"
	@kind create cluster --name $(CLUSTER_NAME) --config config/config-kind-ingress.yaml --image $(CLUSTER_VERSION)
	@echo "## also install nginx-ingress ##"
	@kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/kind/deploy.yaml

start-nodeport:  ## Create kind with nodeport :30007
	@echo "## Start kind cluster with nodeport :3007 ##"
	@kind create cluster --name $(CLUSTER_NAME) --config config/config-kind-nodeport.yaml --image $(CLUSTER_VERSION)

start-calico: ## Create kind with Calico
	@echo "## Start kind cluster with Calico ##"
	@kind create cluster --name $(CLUSTER_NAME) --config config/config-kind-calico.yaml --image $(CLUSTER_VERSION)
	@kind get nodes | xargs -n1 -I {} docker exec {} sysctl -w net.ipv4.conf.all.rp_filter=0
	@curl https://docs.projectcalico.org/v3.16/manifests/calico.yaml | kubectl apply -f -

enable-helmv2:  ## Enable tiller server for helm 2
	@echo "## Install tiller on K8s ##"
	@kubectl -n kube-system create serviceaccount tiller
	@kubectl create clusterrolebinding tiller \
    	--clusterrole cluster-admin \
    	--serviceaccount=kube-system:tiller
	@helm init --service-account tiller
	@kubectl get pods --namespace kube-system

start-istio:  ## Create kind with nodeport :30007
	@echo "## Start kind cluster with istio + nodeport :3007 ##"
	@kind create cluster --name $(CLUSTER_NAME) --config config/config-kind-nodeport.yaml --image $(CLUSTER_VERSION)
	@istioctl operator init
	@kubectl create ns istio-system
	@ kubectl apply -f istio/istioperator.yaml
 
delete-cluster: ## Delete cluster kind
	@kind delete cluster --name $(CLUSTER_NAME)