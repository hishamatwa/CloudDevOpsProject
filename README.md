# CloudDevOpsProject

<p align="center">
  <img src="https://img.shields.io/badge/AWS-EKS-orange?style=for-the-badge&logo=amazonaws" />
  <img src="https://img.shields.io/badge/Terraform-IaC-623CE4?style=for-the-badge&logo=terraform" />
  <img src="https://img.shields.io/badge/Jenkins-CI/CD-D24939?style=for-the-badge&logo=jenkins" />
  <img src="https://img.shields.io/badge/Kubernetes-Orchestration-326CE5?style=for-the-badge&logo=kubernetes" />
  <img src="https://img.shields.io/badge/Docker-Containers-2496ED?style=for-the-badge&logo=docker" />
</p>

Complete DevOps implementation on AWS using Terraform, Jenkins, Docker, Kubernetes, and Amazon EKS.

---

## Table of Contents

- [Project Overview](#project-overview)
- [Tech Stack](#tech-stack)
- [Project Workflow](#project-workflow)
- [Infrastructure Provisioning](#infrastructure-provisioning)
- [Configuration Management](#configuration-management)
- [CI/CD Pipeline](#cicd-pipeline)
- [Kubernetes Deployment](#kubernetes-deployment)
- [AWS Infrastructure Screenshots](#aws-infrastructure-screenshots)
- [Usage Instructions](#usage-instructions)
- [Verification](#verification)
- [Setup Documentation](#setup-documentation)

---

## Project Overview

This project demonstrates a complete DevOps workflow starting from infrastructure provisioning to automated application deployment on Kubernetes.

### Main Features

* Infrastructure provisioning using Terraform
* Jenkins CI/CD pipeline automation
* Docker containerization
* Amazon ECR image management
* Kubernetes deployment on Amazon EKS
* Rolling deployment updates
* Configuration management using Ansible

---

## Tech Stack

| Category | Tools |
|---|---|
| Cloud Provider | AWS |
| Infrastructure as Code | Terraform |
| Configuration Management | Ansible |
| CI/CD | Jenkins |
| Containerization | Docker |
| Container Registry | Amazon ECR |
| Container Orchestration | Kubernetes / Amazon EKS |
| Application | Flask |
| Version Control | Git & GitHub |

---

## Project Workflow

GitHub → Jenkins → Docker Build → Amazon ECR → Amazon EKS → Flask Application

```text
Developer
   ↓
GitHub Repository
   ↓
Jenkins Pipeline
   ↓
Docker Build
   ↓
Amazon ECR
   ↓
Amazon EKS
   ↓
Flask Application
```

---

## Infrastructure Provisioning

Terraform was used to provision:

* Custom AWS VPC
* Public and Private Subnets
* Internet Gateway
* NAT Gateway
* Route Tables
* Security Groups
* Jenkins EC2 Server
* Amazon EKS Cluster
* EKS Worker Nodes
* Amazon ECR Repository

### Terraform Deployment

```bash
cd terraform/environments/dev

terraform init
terraform plan
terraform apply
```

Terraform successfully initialized and applied the AWS infrastructure resources.

<img width="85%" height="77" alt="19-terraform-output" src="https://github.com/user-attachments/assets/f856fab1-d24d-4a31-8fe8-9cdfe5958fff" />

---

## Configuration Management

Ansible was used to configure the Jenkins EC2 instance and automate local cleanup operations.

### Configure Jenkins

```bash
ansible-playbook ansible/playbooks/configure-jenkins.yml
```

### Cleanup Generated Files

```bash
ansible-playbook ansible/playbooks/cleanup-local.yml
```

---

## CI/CD Pipeline

The Jenkins pipeline automates the following workflow:

1. Pull source code from GitHub
2. Build Docker image
3. Scan Docker image using Trivy
4. Push image to Amazon ECR
5. Update Kubernetes manifests
6. Deploy application to Amazon EKS
7. Perform rolling deployment updates

### Successful Jenkins Pipeline

<img width="85%" height="675" alt="24-jenkins-successful-pipeline" src="https://github.com/user-attachments/assets/0111bb55-000a-44b2-8399-36ed6db265e4" />

---

### Docker Build Output

<img width="85%" height="965" alt="25-jenkins-docker-build-output" src="https://github.com/user-attachments/assets/e1770ab2-716d-459b-9d62-236e056ef2b4" />

---

### Amazon ECR Push Output

<img width="85%" height="977" alt="26-jenkins-ecr-push-output" src="https://github.com/user-attachments/assets/c048da71-d37a-4f63-9edd-855e21c9661e" />

---

## Kubernetes Deployment

The Flask application is deployed on Amazon EKS using Kubernetes manifests.

### Deploy Application

```bash
kubectl apply -f kubernetes/base/
```

### Verify Resources

```bash
kubectl get nodes
kubectl get pods -A
```

### Kubernetes Nodes

<img width="85%" height="98" alt="20-kubectl-get-nodes" src="https://github.com/user-attachments/assets/45cdba40-eef1-4bab-ba1b-9aea74f8f08f" />

---

### Updated Deployment Image

<img width="85%" height="43" alt="22-kubernetes-deployment-image" src="https://github.com/user-attachments/assets/5e5358ed-43e9-4006-8e82-a49f4a3257fe" />

---

### Running Application

<img width="85%" height="967" alt="23-application-running" src="https://github.com/user-attachments/assets/5d035d0a-908b-41bc-9a69-eae06e560a67" />

---

## AWS Infrastructure Screenshots

### Amazon ECR Repository

<img width="85%" height="932" alt="01-ecr-repository-images" src="https://github.com/user-attachments/assets/c80e285b-4384-4aee-9bbd-047c2c612895" />

---

### Custom VPC

<img width="85%" height="923" alt="04-cloud-devops-vpc-details" src="https://github.com/user-attachments/assets/20582cf9-f6ee-4268-b1b8-71ea63178c08" />

---

### VPC Resource Map

<img width="85%" height="932" alt="05-vpc-resource-map" src="https://github.com/user-attachments/assets/9c390f24-7fa2-45d6-9090-5e1cc8905ca8" />

---

### Amazon EKS Cluster

<img width="85%" height="921" alt="16-eks-cluster-overview" src="https://github.com/user-attachments/assets/cffd5d1e-5eb1-49a0-892e-098fa55abc52" />

---

## Usage Instructions

### Clone Repository

```bash
git clone https://github.com/hishamatwa/CloudDevOpsProject.git

cd CloudDevOpsProject
```

### Configure AWS CLI

```bash
aws configure
```

### Deploy Infrastructure

```bash
cd terraform/environments/dev

terraform init
terraform apply
```

### Configure Jenkins

```bash
ansible-playbook ansible/playbooks/configure-jenkins.yml
```

### Deploy Kubernetes Resources

```bash
kubectl apply -f kubernetes/base/
```

---

## Verification

The following checks were completed successfully:

* Jenkins pipeline executed successfully
* Docker image pushed to Amazon ECR
* Amazon EKS cluster deployed successfully
* Kubernetes pods running successfully
* Rolling deployment updates completed successfully
* Flask application accessible through Kubernetes service

---

## Setup Documentation

Additional setup documentation is available inside:

```bash
docs/setup/
```

Included files:

* terraform.md
* ansible.md
* kubernetes.md
* jenkins.md
* argocd.md
