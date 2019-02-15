#!/bin/bash

if which kubectl > /dev/null 2>&1; then
  kubectl_get_pod_and_node() {
    kubectl get pod -o=custom-columns=NAME:.metadata.name,STATUS:.status.phase,NODE:.spec.nodeName $1
  }
fi
