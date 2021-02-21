# `Docker Desktop for Mac` 开启并使用 `Kubernetes`

[![github workflow](https://github.com/maguowei/k8s-docker-desktop-for-mac/workflows/k8s%20image%20sync/badge.svg)](https://github.com/maguowei/k8s-docker-desktop-for-mac/actions)

`Docker Desktop` 可以方便的启用 `Kubernetes` 集群, 为学习 `Kubernetes` 提供了极大的便利, 但是由于众所周知的原因, 国内的网络下不能很方便的下载 `Kubernetes` 集群所需要的镜像, 导致集群启用失败. 这里提供了一个简单的方法, 利用 [GitHub Actions](https://developer.github.com/actions/creating-github-actions/) 实现 `k8s.gcr.io` 上 `kubernetes` 依赖镜像自动同步到 [Docker Hub](https://hub.docker.com/) 上指定的仓库中。 通过 [load_images.sh](./load_images.sh) 将所需镜像从 `Docker Hub` 的同步仓库中取回，并重新打上原始的`tag`. 镜像对应关系文件可以查看: [images](./images).

说明:

- 当前在 `Docker Desktop (Mac) Version 3.1.0 (51484) - (Kubernetes: v1.19.3)`上经过测试可用
- 使用 `Kubeadm` 在`Ubuntu`上安装 `Kubernetes` 请查看 [gotok8s](https://github.com/maguowei/gotok8s)

## 安装并启动

1. 下载安装 [Docker Desktop (Mac)](https://desktop.docker.com/mac/stable/Docker.dmg)

2. 从 `Docker Hub` 的同步仓库中取回，并重新打上原始的`tag`.

```bash
./load_images.sh
```

3. 在`Docker for Mac` 设置中启用 `Kubernetes` 选项, 并等待一会儿，直到 `Kubernetes` 开始运行。

![k8s](./image/k8s.png)

4. 可选的步骤: 切换`Kubernetes`运行上下文至 `docker-desktop`

```bash
# 一般只有在之前用其他方式运行过Kubernetes才需要
$ kubectl config use-context docker-desktop
```

5. 验证 `Kubernetes` 集群状态

```bash
$ kubectl cluster-info
$ kubectl get nodes
$ kubectl describe node
```

## 参考

- [部署 Kubernetes Dashboard](https://github.com/maguowei/k8s-cookbook#%E9%83%A8%E7%BD%B2-kubernetes-dashboard)
- [Helm 的使用](https://github.com/maguowei/k8s-cookbook#helm)
