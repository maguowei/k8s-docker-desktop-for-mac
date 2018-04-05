# Enable Kubernetes on Docker for Mac in China

NOTE: It is tested on Docker for Mac 18.03

## Install

1. Install [Docker for Mac](https://docs.docker.com/docker-for-mac/install/) or Windows

2. Config [registry mirror](https://www.docker-cn.com/registry-mirror) for Docker daemon with ```https://registry.docker-cn.com```

![mirror](./image/mirror.jpg)


3. Preload Kubernetes images form Alibaba Cloud Registry Service, NOTE: you can modify the ```images.properties``` for your own images

```bash
./load_images.sh
```

4. Enable Kubernetes in Docker for Mac, and wait a while for Kubernetes is running

![k8s](./image/k8s.jpg)

5. Optional: switch the context to docker-for-desktop

```bash
kubectl config use-context docker-for-desktop
```

6. Verify Kubernetes installation

```bash
kubectl cluster-info
kubectl get nodes
```

7. Deploy Kubernetes dashboard

```bash
kubectl create -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml
```

8. Creates proxy server

```bash
kubectl proxy
```

9. Access dashboard

```
http://localhost:8001/ui
```

## Usseful

- show pods in the kube-system namespace.

```bash
kubectl get pods --namespace kube-system

# list images only
kubectl get pods --namespace kube-system -o jsonpath="{..image}"
```


## Reference

- [Kubernetes Documentation](https://kubernetes.io/docs/home/)
- [Kubernetes Documentation CN](https://k8smeetup.github.io/)
- [kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
- [Awesome-Kubernetes](https://github.com/ramitsurana/awesome-kubernetes)
- [Kubernetes Handbook](https://github.com/rootsongjc/kubernetes-handbook)
