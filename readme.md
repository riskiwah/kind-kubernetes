# Local Kubernetes Lab

My simple local kubernetes playground.

## Prerequisites

* [kind](https://github.com/kubernetes-sigs/kind/)
* [kubectl](https://kubernetes.io/docs/setup/release/notes/)
* [helm](https://github.com/helm/helm)

## Running

```bash
$ make
Usage:
  make <target>

Targets:
  help                  Show help
  start-kind-ingress    Create kind
  start-nodeport        Create kind with nodeport :30007
  start-calico          Create kind with Calico
  enable-helmv2         Enable tiller server for helm 2
  delete-cluster        Delete cluster kind
```

## License

I'm tired of this kind of bullshit. I, hereby, choose WTFPL (Do What The Fuck Yo
u Want To Public License) for this code.

	           DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
	                   Version 2, December 2004

	Everyone is permitted to copy and distribute verbatim or modified
	copies of this license document, and changing it is allowed as long
	as the name is changed.

	           DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
	  TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

	 0. You just DO WHAT THE FUCK YOU WANT TO.
     
### Enjoy

