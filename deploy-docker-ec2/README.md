# 🚀 AWS EC2 + Docker Deployment Automation

This project automates the creation and configuration of an AWS EC2 instance using **Terraform** and **Ansible**, setting up a Docker environment and deploying containers via Docker Compose.

---

## 📌 Features

- **Infrastructure as Code (IaC)** with Terraform
- Automated **Docker & Docker Compose installation**
- Secure EC2 provisioning with custom VPC and Security Groups
- Remote **Ansible provisioning** via `local-exec` provisioner
- Full deployment of containers using `docker-compose`

---

## 🛠 Tech Stack

| Tool         | Purpose                           |
|--------------|-----------------------------------|
| Terraform    | AWS resource provisioning         |
| Ansible      | Configuration management & deploy |
| AWS EC2      | Cloud compute instance            |
| Docker       | Containerization platform         |
| Docker Compose | Multi-container orchestration    |
| Amazon Linux 2 | Base OS image for EC2 instance  |

---

## 📁 Folder Structure

```
.
├── main.tf                        # Terraform infrastructure
├── variables.tf                  # Terraform variable definitions
├── terraform.tfvars              # Variable values (should be gitignored)
├── deploy-docker-new-user.yaml   # Ansible playbook for Docker setup & deployment
├── docker-compose-full.yaml      # Docker Compose file for containers
├── project-vars                  # External variables for Ansible
└── .gitignore                    # Ignored files & folders
```

---

## 🔐 Variables Required

Terraform (`terraform.tfvars`):
```hcl
vpc_cidr_block     = "10.0.0.0/16"
subnet_cidr_block  = "10.0.1.0/24"
avail_zone         = "us-west-1a"
env_prefix         = "dev"
my_ip              = "YOUR_PUBLIC_IP/32"
instance_type      = "t2.micro"
public_key_location = "~/.ssh/YOUR-KEY.pub"
image_name         = "amzn2-ami-hvm-*-x86_64-gp2"
ssh_key_private    = "~/.ssh/YOUR-PRIVATE-KEY"
```

Ansible (`project-vars`):
```yaml
docker_password: your_dockerhub_password
user_groups: docker
docker_compose_url: https://github.com/docker/compose/releases/download/v2.26.1/docker-compose-linux-x86_64
```

---

## 🚀 How to Use

### Step 1: Initialize Terraform
```bash
terraform init
```

### Step 2: Plan Infrastructure
```bash
terraform plan
```

### Step 3: Apply and Deploy
```bash
terraform apply 
```

Terraform will provision AWS infrastructure and run the Ansible playbook via `local-exec`.

---

## 📤 Output

- `ec2_public_ip` – IP address of the EC2 instance
- `ec2_instance_id` – EC2 resource ID
- `aws_ami_id` – ID of the AMI used

---

## 🧼 Cleanup

To destroy all provisioned resources:
```bash
terraform destroy
```

---

## 📌 Notes

- Ensure SSH key paths and Docker credentials are valid
- Your IP must match `my_ip` to allow SSH access via security group
- Python 3.8+ must be installed on the EC2 AMI or installed via user-data script