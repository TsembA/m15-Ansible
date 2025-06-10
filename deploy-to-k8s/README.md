# 🚀 Kubernetes Application Deployment with Terraform and Ansible

This project automates the provisioning of a Kubernetes (EKS) cluster on AWS and deploys a containerized Nginx application using an Ansible playbook. It showcases an end-to-end DevOps pipeline, including infrastructure provisioning, Kubernetes cluster setup, and deployment configuration.

---

## ✅ Features

* Provision secure and scalable AWS VPC
* Create Amazon EKS Cluster with managed node groups
* Configure Kubernetes namespaces and ConfigMaps via Ansible
* Deploy containerized Nginx application to EKS
* Mount custom Nginx config from local file to pods

---

## 🛠️ Tech Stack

| Tool       | Purpose                                 |
| ---------- | --------------------------------------- |
| Terraform  | Provision AWS VPC and EKS resources     |
| AWS        | Cloud provider (VPC, EKS, IAM, EC2)     |
| Ansible    | Automate Kubernetes resource management |
| Amazon EKS | Managed Kubernetes Cluster              |
| Kubernetes | Container orchestration platform        |
| Nginx      | Web server used as sample deployment    |

---

## 📂 Infrastructure Structure

# https://github.com/TsembA/m12-Terraform-Projects/tree/feature/eks

### VPC Module (`vpc.tf`)

* Uses `terraform-aws-modules/vpc`
* Configurable CIDR blocks
* Creates private and public subnets
* Tags for Kubernetes ingress/ELB support

### EKS Cluster (`eks-cluster.tf`)

* Uses `terraform-aws-modules/eks`
* Kubernetes version 1.32
* Managed Node Groups (1-3 `t2.small` instances)
* Public endpoint access enabled

---

## 📦 Kubernetes Deployment via Ansible

### Playbook: `deploy-to-k8s.yaml`

Tasks:

1. Create a Kubernetes namespace (`my-app`)
2. Create a ConfigMap from local `nginx.conf`
3. Deploy Nginx using a deployment manifest

ConfigMap mounts the local `nginx.conf` file into pod path `/etc/nginx/nginx.conf`.

---

## 📁 Directory Layout

```
.
├── vpc.tf                    # VPC config
├── eks-cluster.tf           # EKS setup
├── terraform.tfvars        # Variable inputs
├── nginx.conf               # Local Nginx configuration
├── nginx-deployment.yaml    # K8s deployment definition
├── deploy-to-k8s.yaml       # Ansible deployment playbook
```

---

## 🚀 Usage

### 1. Deploy EKS Infrastructure

```bash
terraform init
terraform apply
```

### 2. Run Ansible Playbook

```bash
ansible-playbook deploy-to-k8s.yaml
```

Ensure `~/.kube/config` is configured for the EKS cluster.

---

## 🔐 Prerequisites

* AWS CLI configured with credentials
* Terraform installed
* Ansible installed with `kubernetes.core` collection:

  ```bash
  ansible-galaxy collection install kubernetes.core
  ```
* kubectl configured and working with EKS cluster

---

## 🖊️ Notes

* `nginx.conf` must exist locally and be valid
* ConfigMap is dynamically created via Ansible
* EKS nodes must have IAM permissions to pull container images
