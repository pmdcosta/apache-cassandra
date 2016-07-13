# Apache Cassandra on Docker
This repository contains a collection of images and scripts to run Cassandra on Docker containers. These images can be run locally or on a Kubernetes cluster. The current supported version is 2.1.

- Deployments supported:
	- A single Cassandra node (TODO)
	- A multi-node cluster using Docker Compose (TODO)
	- A multi-node clutser on a Kubernetes Clutser

# Getting started

## Single Cassandra node
TODO

## Multi-Node Cassandra cluster
TODO

## Cloud Native Cassandra on Kubernetes
### Prerequisites
- A Kubernetes version 1.2+ cluster installed and running.
- Kubectl command line tool installed and configured.

### Cassandra Docker
The pods are based on the `gcr.io/google-samples/cassandra:v8` image from Google's container registry, which is based on debian:jessie and includes OpenJDK 8. This image includes a standard Cassandra installation from the Apache Debian repo.
Through the use of environment variables you are able to change values that are inserted into the `cassandra.yaml`.

### Custom Seed Provider
A custom `SeedProvider` is included for running Cassandra on top of Kubernetes. In Cassandra, a SeedProvider bootstraps the gossip protocol that Cassandra uses to find other Cassandra nodes. Cassandra nodes use the seed list to find each other and learn the topology of the ring. The `KubernetesSeedProvider` discovers Cassandra seeds IP addresses vis the Kubernetes API, those Cassandra instances are defined within the Cassandra Service.

### Default Namespaces and Tables
A `kubernetes/config/build.cql` file can be changed to contain default Cassandra tables.

### Deployment
```
# Create a replication controller and service to deploy cassandra nodes
kubectl create -f kubernetes/cassandra.yaml

# Validate the Cassandra cluster.
./kubernetes/build/nodetool.sh

# Scale up the Cassandra cluster
kubectl scale rc cassandra --replicas=3

# Create Namespaces and tables
./kubernetes/build/build.sh
```
