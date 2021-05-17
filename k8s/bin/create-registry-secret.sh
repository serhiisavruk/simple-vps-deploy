#!/bin/bash

kubectl create secret docker-registry ghcr-secret \
--docker-server=https://ghcr.io \
--docker-username=$USERNAME \
--docker-password=$PASSWORD