# Ansible Nexus Automation

This repository contains an Ansible playbook to automate the setup of Sonatype Nexus Repository Manager OSS on a remote Ubuntu host.

## 📌 Features

- Installs Java 8 and required utilities
- Downloads and extracts the latest Nexus installer
- Creates a dedicated `nexus` system user and sets proper folder permissions
- Starts Nexus as a daemon
- Verifies successful launch with `ps` and `netstat` checks

---

## 📦 Requirements

- Ansible 2.9+
- Ubuntu 20.04/22.04 server
- Minimum 2 GB RAM

---

## ⚙️ Inventory (`hosts`)

Update your `hosts` file:

```ini
[nexus]
your.server.ip ansible_user=root ansible_ssh_private_key_file=~/.ssh/your_key
```

---

## 📂 Folder Structure

```bash
├── deploy-setup.yml         # Main playbook
├── hosts                   # Inventory file
└── README.md
```

---

## 🚀 Usage

# Run the playbook:

```bash
ansible-playbook -i hosts nexus-setup.yml
```

---

## 🌐 Access Nexus

After successful deployment, open the Nexus UI in your browser:

```
http://your.server.ip:8081
```

Default admin credentials:

- Username: `admin`
- Password: (found in `/opt/sonatype-work/nexus3/admin.password`)

---
