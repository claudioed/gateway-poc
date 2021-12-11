#!/bin/bash
kubectl create ns monitoring
helm repo add stable https://charts.helm.sh/stable
 helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install prometheus prometheus-community/kube-prometheus-stack --namespace monitoring
