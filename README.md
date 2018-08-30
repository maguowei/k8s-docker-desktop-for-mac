# `Docker for Mac`开启并使用 `Kubernetes`

`Docker for Mac` 最新版本已经可以简单的启用 `Kubernetes` 集群, 为学习 `Kubernetes` 提供了极大的便利, 但是由于众所周知的原因, 国内的网络下不能很方便的下载 `Kubernetes` 集群所需要的镜像文件, 导致集群启用失败. 这里提供了一个简单的方法, 利用阿里云的镜像服务, 预先下载镜像文件, 以方便 `Kubernetes` 学习和使用。

说明:
 - 本设置在`Docker for Mac 18.06 (with Kubernetes 1.10.3)`上经过测试可用
 - `Docker for Windows` 最新版理论上也可用, 但是没有经过测试
 - 使用 `Kubeadm` 在`Ubuntu`上安装 `Kubernetes` 请查看 [kubernetes-for-china](https://github.com/maguowei/kubernetes-for-china)

## 安装并设置

1. 安装 [Docker for Mac](https://docs.docker.com/docker-for-mac/install/)

2. 设置 `Docker` 中国官方镜像加速 [registry mirror](https://www.docker-cn.com/registry-mirror) ```https://registry.docker-cn.com```

![mirror](./image/mirror.jpg)

3. 预先从阿里云`Docker`镜像下载 `Kubernetes` 所需要的镜像, 可以通过修改 [./images](./images) 文件定制你自己需要的镜像

```bash
$ ./load_images.sh
```

4. 在`Docker for Mac` 设置中启用 `Kubernetes` 选项, 并等待一会儿，直到 `Kubernetes` 开始运行。

![k8s](./image/k8s.jpg)

5. 可选的步骤: 切换`Kubernetes`运行上下文至 `docker-for-desktop`

```bash
# 一般只有在之前用其他方式运行过Kubernetes才需要
$ kubectl config use-context docker-for-desktop
```

6. 验证 `Kubernetes` 集群状态

```bash
$ kubectl cluster-info
$ kubectl get nodes
```

7. 部署 `Kubernetes dashboard`

```bash
$ kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml

# 开启本机访问代理
$ kubectl proxy
```

通过下面的连接访问 `Dashboard`:
[`http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/`](
http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/)

获取 `Dashboard` `admin` 权限:
[`https://github.com/kubernetes/dashboard/wiki/Access-control#admin-privileges`](https://github.com/kubernetes/dashboard/wiki/Access-control#admin-privileges)

## [Helm](https://helm.sh/)

```bash
# 用 homebrew 安装 Helm
$ brew install kubernetes-helm

# 初始化本地 CLI 并 将 Tiller 安装到 Kubernetes cluster
$ helm init

# 更新本地 charts repo
$ helm repo update

# 安装 mysql chart
$ helm install --name my-mysql stable/mysql

# 删除 mysql
$ helm delete my-mysql

# 删除 mysql 并释放该名字以便后续使用
$ helm delete --purge my-mysql
```

## 参考

- [Kubernetes Documentation](https://kubernetes.io/docs/home/)
- [kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
- [Awesome-Kubernetes](https://github.com/ramitsurana/awesome-kubernetes)
- [Kubernetes Handbook](https://github.com/rootsongjc/kubernetes-handbook)
