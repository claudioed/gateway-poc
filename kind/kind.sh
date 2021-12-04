#!/bin/bash
kind create cluster --name gateway --config clusterconfig.yaml
kubectl cluster-info --context kind-gateway
kubectl create clusterrolebinding add-on-cluster-admin --clusterrole=cluster-admin --serviceaccount=kube-system:default
