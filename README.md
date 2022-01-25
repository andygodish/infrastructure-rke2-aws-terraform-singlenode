# infrastructure-rke2-aws-terraform

Terraform script designed to quickly stand up a single node RKE2 cluster.

Ideally we would want this to be bootstrapped with Rancher alredy installed as this will be your primary infrastructure for your upstream rancher lab.

## Quick Commands

```
# terraform

terraform apply -var-file=terraform.tfvars --auto-approve
terraform destroy -var-file=terraform.tfvars --auto-approve

# rke2 configuration

export PATH=/var/lib/rancher/rke2/bin:$PATH
export KUBECONFIG=/etc/rancher/rke2/rke2.yaml
alias k=kubectl

# retrieve kubeconfig

scp rke2-singlenode:/tmp/rke2.yaml ~/.kube/config
