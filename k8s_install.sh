#!/bin/bash
# Script For Quick Pull K8S Docker Images
# by Hellxz Zhang <hellxz001@foxmail.com>

# please run kubeadm for get version msg. e.g `kubeadm config images list --kubernetes-version v1.18.3`
# then modified the Version's ENV, Saved and Run. 

KUBE_VERSION=v1.21.1
PAUSE_VERSION=3.4.1
CORE_DNS_VERSION=1.8.0
ETCD_VERSION=3.4.13-0

# pull aliyuncs mirror docker images
docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/kube-proxy:$KUBE_VERSION
docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/kube-controller-manager:$KUBE_VERSION
docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/kube-apiserver:$KUBE_VERSION
docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/kube-scheduler:$KUBE_VERSION
docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/pause:$PAUSE_VERSION
docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/coredns/coredns:$CORE_DNS_VERSION
docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/etcd:$ETCD_VERSION
docker pull coredns/coredns:$CORE_DNS_VERSION

# retag to k8s.gcr.io prefix
docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/kube-proxy:$KUBE_VERSION  k8s.gcr.io/kube-proxy:$KUBE_VERSION
docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/kube-controller-manager:$KUBE_VERSION k8s.gcr.io/kube-controller-manager:$KUBE_VERSION
docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/kube-apiserver:$KUBE_VERSION k8s.gcr.io/kube-apiserver:$KUBE_VERSION
docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/kube-scheduler:$KUBE_VERSION k8s.gcr.io/kube-scheduler:$KUBE_VERSION
docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/pause:$PAUSE_VERSION k8s.gcr.io/pause:$PAUSE_VERSION
docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/coredns:$CORE_DNS_VERSION k8s.gcr.io/coredns/coredns:$CORE_DNS_VERSION
docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/etcd:$ETCD_VERSION k8s.gcr.io/etcd:$ETCD_VERSION
docker tag coredns/coredns:$CORE_DNS_VERSION k8s.gcr.io/coredns/coredns:v$CORE_DNS_VERSION

# untag origin tag, the images won't be delete.
docker rmi registry.cn-hangzhou.aliyuncs.com/google_containers/kube-proxy:$KUBE_VERSION
docker rmi registry.cn-hangzhou.aliyuncs.com/google_containers/kube-controller-manager:$KUBE_VERSION
docker rmi registry.cn-hangzhou.aliyuncs.com/google_containers/kube-apiserver:$KUBE_VERSION
docker rmi registry.cn-hangzhou.aliyuncs.com/google_containers/kube-scheduler:$KUBE_VERSION
docker rmi registry.cn-hangzhou.aliyuncs.com/google_containers/pause:$PAUSE_VERSION
docker rmi registry.cn-hangzhou.aliyuncs.com/google_containers/coredns:$CORE_DNS_VERSION
docker rmi registry.cn-hangzhou.aliyuncs.com/google_containers/etcd:$ETCD_VERSION
docker rmi coredns/coredns:$CORE_DNS_VERSION
