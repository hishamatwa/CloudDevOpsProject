# Ansible Setup

## Overview

Ansible is used to configure the Jenkins EC2 instance automatically after infrastructure provisioning.

The Ansible configuration installs and configures:

- Docker
- Jenkins
- kubectl
- Trivy

---

# Ansible Structure

```text
ansible/
├── ansible.cfg
├── inventories/
│   └── aws_ec2/
│       └── aws_ec2.yml
├── playbooks/
│   └── configure-jenkins.yml
└── roles/
    ├── docker/
    ├── jenkins/
    ├── kubectl/
    └── trivy/
```

---

# Dynamic Inventory

The project uses the `amazon.aws.aws_ec2` dynamic inventory plugin to automatically discover the Jenkins EC2 instance from AWS.

---

# Install Required Collection

```bash
ansible-galaxy collection install amazon.aws
```

---

# Install Python Dependencies

```bash
pip install boto3 botocore
```

---

# Verify Inventory

```bash
ansible-inventory -i inventories/aws_ec2/aws_ec2.yml --graph
```

---

# Run Ansible Playbook

```bash
ansible-playbook playbooks/configure-jenkins.yml
```

---

# Roles Overview

## Docker Role

Responsible for:

- Installing Docker
- Starting Docker service
- Adding ec2-user to docker group

---

## Jenkins Role

Responsible for:

- Installing Java 17
- Installing Jenkins
- Starting Jenkins service

---

## kubectl Role

Responsible for:

- Downloading kubectl binary
- Configuring kubectl access

---

## Trivy Role

Responsible for:

- Installing Trivy
- Configuring Trivy repository

---

# Benefits of Ansible in This Project

- Automated Server Configuration
- Reusable Roles
- Infrastructure Consistency
- Faster Provisioning
- Reduced Manual Configuration
