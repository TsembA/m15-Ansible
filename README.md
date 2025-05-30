# Ansible Playbook: Node.js App Deployment

This Ansible project automates the installation of Node.js and npm, creates a dedicated user, and deploys a Node.js application to a target server.

## 🔧 Features

- Updates APT cache and installs Node.js and npm
- Creates a dedicated `ansible-user` on the remote host
- Copies and unpacks a prepackaged Node.js app
- Installs dependencies and launches the app in the background
- Verifies the application is running

## 📁 Project Structure

```text
.
├── playbook.yml                  # The main Ansible playbook (this file)
├── nodejs-app/
│   └── nodejs-app-1.0.0.tgz      # The pre-packaged Node.js application
```

## 🖥️ Prerequisites

- A target server defined under the `webserver` inventory group
- SSH access to the server with the private key
- Ansible installed on your control node

## ▶️ How to Run

1. **Clone the repo**  
   ```bash
   git clone https://github.com/TsembA/m15-Ansible.git
   cd m15-Ansible
   ```

2. **Run the playbook**  
   ```bash
   ansible-playbook -i hosts deploy-node.yaml
   ```

## ✅ Result

After running the playbook, the Node.js app should be up and running on your target server under the `ansible-user`.

