# Enable Kubernetes on Docker for Mac in China

NOTE: It is tested on Docker for Mac 18.02/18.03

1. Install [Docker for Mac](https://docs.docker.com/docker-for-mac/install/) or Windows

2. Config [registry mirror](https://www.docker-cn.com/registry-mirror) for Docker daemon with ```https://registry.docker-cn.com```

![mirror](./image/mirror.jpg)


3. Preload Kubernetes images form Alibaba Cloud Registry Service, NOTE: you can modify the ```images.properties``` for your own images

```
./load_images.sh
```

4. Enable Kubernetes in Docker for Mac, and wait a while for Kubernetes is running

![k8s](./image/k8s.jpg)

5. Optional: switch the context to docker-for-desktop

```
kubectl config use-context docker-for-desktop
```

6. Verify Kubernetes installation

```
kubectl cluster-info
kubectl get nodes
```

7. Deploy Kubernetes dashboard

```
kubectl create -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml
```

8. Creates proxy server

```
kubectl proxy
```

9. Access dashboard

```
http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/overview?namespace=default
```

