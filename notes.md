rbac
---

- https://github.com/scriptcamp/kubernetes-serviceaccount-example
- https://devopscube.com/kubernetes-api-access-service-account/
- https://devopscube.com/create-kubernetes-role/

Get swagger.json API k8s:

- kubectl proxy
- curl http://127.0.0.1:8001/openapi/v2 > code/kind-kubernetes/playgrund/swagger.json
- then mount it on docker compose volumes