#!/bin/bash

CASSANDRA=$(kubectl get pods | grep cassandra | awk 'NR==1' | awk '{ print $1 }')
CASSANDRA_STATUS=$(kubectl get pods | grep cassandra | awk 'NR==1' | awk '{ print $3 }')
while [ "$CASSANDRA_STATUS" != "Running" ]; do
	echo "================== $CASSANDRA is currently $CASSANDRA_STATUS"
	CASSANDRA=$(kubectl get pods | grep cassandra | awk 'NR==1' | awk '{ print $1 }')
	CASSANDRA_STATUS=$(kubectl get pods | grep cassandra | awk 'NR==1' | awk '{ print $3 }')
	sleep 5
done
sleep 5
echo "================== Configuring $CASSANDRA ====================="
kubectl exec $CASSANDRA -- cqlsh -f build.cql $CASSANDRA
echo "================== Done ======================================="
