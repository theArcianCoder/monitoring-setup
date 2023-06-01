
Custom Monitoring Setup 

This is a Custom Monitoring Setup with additional dashboards added with the help of the kube-prometheus-stack chart from prometheus-community helm charts.


## Requirements

Before installation please have a these dependencies installed:

  1. Helm
  2. Kubectl
  3. minikube(if installation on minikube)
  4. kubeadm and other tools for cloud
  5. Lens-Desktop

## Installation

Clone the repo using command :

```bash
  git clone https://github.com/theArcianCoder/monitoring-setup.git
```
Open the project using the Integrated terminal :

```bash
  helm install <release-name> ./
```
Your Helm chart for custom monitoring gets installed without hassle.

Change the service type to NodePort or LoadBalancer according to the ease of access.




****Happy Helming ****