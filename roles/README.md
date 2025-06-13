# 📦 Ansible Roles Project – Modular Configuration Management on AWS

## 🔧 Technologies Used
- Ansible
- Docker
- Docker Compose
- AWS EC2
- Amazon Linux 2

---

## 📘 Project Description

This project demonstrates how to structure Ansible playbooks using **roles** to automate Docker-based deployments on AWS EC2 instances. Instead of maintaining a single large playbook, tasks are organized into logical, reusable **roles** for better clarity, scalability, and maintenance.

Provisioned EC2 instances are configured using Ansible to:
- Install Docker and Docker Compose
- Create a dedicated Linux user
- Authenticate with Docker Hub
- Run containerized services via `docker-compose`

This approach enables modular and repeatable infrastructure configuration, suitable for scalable DevOps workflows.

---

## 📁 Project Structure

```
.
├── roles/
│   ├── create_user/
│   │   └── tasks/
│   │       └── main.yaml
│   ├── start_containers/
│   │   ├── files/
│   │   │   └── docker-compose.yaml
│   │   ├── tasks/
│   │   │   └── main.yaml
│   │   └── vars/
│   │       └── main.yaml
│   └── README.md
├── .gitignore
├── ansible.cfg                   # Ansible configuration file
├── deploy-with-roles.yaml       # Main Ansible playbook using roles
├── hosts                        # Optional static inventory
├── inventory_aws_ec2.yaml       # Dynamic inventory plugin config for AWS
└── project-vars                 # External variables (e.g. Docker credentials)
 

## 📂 Roles Overview

### `create_user`
- Creates a non-root Linux user (`tsemb`)
- Adds user to `docker` and `adm` groups
- Ensures home directory and shell access

### `start_containers`
- Copies `docker-compose.yaml` to target
- Logs into Docker Hub using secrets from `project-vars`
- Runs services (Java App, MySQL, phpMyAdmin) with `docker_compose_v2`

---

## 🚀 How to Use

> Assumes EC2 infrastructure already provisioned with Terraform.

1. 🔐 Fill in your Docker credentials in `project-vars`:

```yaml
docker_username: your_dockerhub_username
docker_password: your_password_or_token
docker_registry: https://index.docker.io/v1/
```

2. ⚙️ Update your Ansible dynamic inventory (`inventory_aws_ec2.yaml`) if needed.

3. ▶️ Run the playbook:

```bash
ansible-playbook deploy-with-roles.yaml -i inventory_aws_ec2.yaml
```

---

## ✅ What This Project Demonstrates

- Breaking down Ansible playbooks into reusable roles
- Secure handling of Docker registry credentials
- Automated Docker Compose deployment on EC2
- Role-based architecture for cleaner and more scalable automation

---
