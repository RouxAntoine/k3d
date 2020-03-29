#!/bin/bash

set -e

make clean

make build GCFLAGS="all=-N -l" \
  LDFLAGS="-X github.com/rancher/k3d/version.Version=v1.7.0-3-gf1730c1 -X github.com/rancher/k3d/version.K3sVersion=v1.17.4-k3s1"

token="K106c8f14749caf4f80fd45de0a06b92d57ed975d7cdc292d2c860a8da8381fe822::server:SZVakvDzAdQcMBkJwFvw"
cluster_name="mycluster"

#dlv --listen=:2345 --headless=true --api-version=2 exec ./bin/k3d -- add-node --k3s https://34.73.103.126:6443:6433 \
#  --k3s-secret "$token"

./bin/k3d add-node \
  --k3s https://34.73.103.126:6443:6433 \
  --name "$cluster_name" \
  --auto-restart \
  --k3s-secret "$token"