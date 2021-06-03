#!/bin/bash

mv ./k8s/chart/Chart.yaml ./k8s/chart/Chart.old.yaml &&
  cat ./k8s/chart/Chart.old.yaml | grep -v appVersion > ./k8s/chart/Chart.yaml &&
#  echo -e "\r\nappVersion: v${GITHUB_REF##*/}\r\n" >> ./.helm/app/Chart.yaml &&
  echo -e "\r\nappVersion: \"v2\"\r\n" >> ./k8s/chart/Chart.yaml &&
  cat ./k8s/chart/Chart.yaml

helm repo add bitnami https://charts.bitnami.com/bitnami

cd ./k8s/chart && helm dependency build