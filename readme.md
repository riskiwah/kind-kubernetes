# Local Kubernetes Lab w/ Kind

This is one of my local kubernetes setup with Kind, Istio, and Calico

## Prerequisites

* kind
* kubectl
* helm

## Running

```
kind create cluster --config config-kind.yaml
```

wait for up and running then install calico for network-policy

```
curl https://docs.projectcalico.org/v3.8/manifests/calico.yaml| kubectl apply -f -
```

when you already have helm then follow this for install Istio
https://istio.io/docs/setup/kubernetes/install/helm/#option-1-install-with-helm-via-helm-template

### Enjoy

