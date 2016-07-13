#!/usr/bin/env bash

CASSANDRA=$(kubectl get pods | grep cassandra | awk 'NR==1' | awk '{ print $1 }')
kubectl exec -ti $CASSANDRA -- nodetool status
