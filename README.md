# infrastructure-rke2-aws-terraform-singlenode

Terraform script designed to quickly stand up a single node RKE2 cluster.

Ideally we would want this to be bootstrapped with Rancher alredy installed as this will be your primary infrastructure for your upstream rancher lab.

## Quick Commands

```
# terraform

terraform apply -var-file=terraform.tfvars --auto-approve
terraform destroy -var-file=terraform.tfvars --auto-approve

# Cert-Manager

kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.7.1/cert-manager.yaml

# rke2 configuration

export PATH=/var/lib/rancher/rke2/bin:$PATH
export KUBECONFIG=/etc/rancher/rke2/rke2.yaml
alias k=kubectl

# retrieve kubeconfig

scp rke2-singlenode:/tmp/rke2.yaml ~/.kube/infrastructure-rke2-aws-terrraform-singlenode-config && export KUBECONFIG=~/.kube/infrastructure-rke2-aws-terrraform-singlenode-config

export KUBECONFIG=~/.kube/infrastructure-rke2-aws-terrraform-singlenode-config

# Enable LB service creation for nginx ingress controller

```
valuesContent: |-
    controller:
      service:
        enabled: true
```

# Rancher Install

helm install rancher rancher-stable/rancher \
--namespace cattle-system \
--set hostname=rancher.andyg.io \
--set ingress.tls.source=letsEncrypt \
--set replicas=3 \
--set letsEncrypy.email=agodish18@gmail.com --version=2.6.3
