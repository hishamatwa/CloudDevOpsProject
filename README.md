# CloudDevOpsProject

<p align="center">
  <img src="https://img.shields.io/badge/AWS-EKS-orange?style=for-the-badge&logo=amazonaws" />
  <img src="https://img.shields.io/badge/Terraform-IaC-623CE4?style=for-the-badge&logo=terraform" />
  <img src="https://img.shields.io/badge/Jenkins-CI/CD-D24939?style=for-the-badge&logo=jenkins" />
  <img src="https://img.shields.io/badge/Kubernetes-Orchestration-326CE5?style=for-the-badge&logo=kubernetes" />
  <img src="https://img.shields.io/badge/Docker-Containers-2496ED?style=for-the-badge&logo=docker" />
</p>

End-to-end DevOps project deployed on AWS using Terraform, Ansible, Docker, Jenkins, Kubernetes, and Amazon EKS.

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
```

<img width="976" height="77" alt="19-terraform-output" src="https://github.com/user-attachments/assets/f856fab1-d24d-4a31-8fe8-9cdfe5958fff" />

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

<img width="1891" height="675" alt="24-jenkins-successful-pipeline" src="https://github.com/user-attachments/assets/0111bb55-000a-44b2-8399-36ed6db265e4" />

---

### Docker Build Output

<img width="1903" height="965" alt="25-jenkins-docker-build-output" src="https://github.com/user-attachments/assets/e1770ab2-716d-459b-9d62-236e056ef2b4" />



---

### Amazon ECR Push Output



<img width="1892" height="977" alt="26-jenkins-ecr-push-output" src="https://github.com/user-attachments/assets/c048da71-d37a-4f63-9edd-855e21c9661e" />


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

<img width="981" height="98" alt="20-kubectl-get-nodes" src="https://github.com/user-attachments/assets/45cdba40-eef1-4bab-ba1b-9aea74f8f08f" />

---

### Kubernetes Deployment


<img width="1000" height="298" alt="21-kubectl-get-all-ivolve" src="https://github.com/user-attachments/assets/cf4bf655-ccfb-401e-b8a4-dc9b328dda13" />

---

### Updated Deployment Image

<img width="983" height="43" alt="22-kubernetes-deployment-image" src="https://github.com/user-attachments/assets/5e5358ed-43e9-4006-8e82-a49f4a3257fe" />


---

### Running Application


<img width="1918" height="967" alt="23-application-running" src="https://github.com/user-attachments/assets/5d035d0a-908b-41bc-9a69-eae06e560a67" />


---

## AWS Infrastructure Screenshots

### Amazon ECR Repository


<img width="1918" height="932" alt="01-ecr-repository-images" src="https://github.com/user-attachments/assets/c80e285b-4384-4aee-9bbd-047c2c612895" />

---

### ECR Image Details


<img width="1918" height="913" alt="02-ecr-image-details" src="https://github.com/user-attachments/assets/c3c0483b-a417-4c5a-9735-590620583ed8" />


---

### Custom VPC


<img width="1918" height="923" alt="04-cloud-devops-vpc-details" src="https://github.com/user-attachments/assets/20582cf9-f6ee-4268-b1b8-71ea63178c08" />



---

### VPC Resource Map


<img width="1917" height="932" alt="05-vpc-resource-map" src="https://github.com/user-attachments/assets/9c390f24-7fa2-45d6-9090-5e1cc8905ca8" />


---

### NAT Gateway


<img width="1918" height="922" alt="06-nat-gateway" src="https://github.com/user-attachments/assets/57d5776e-dfac-4c3f-8463-852448cb292d" />


---

### Route Tables


<img width="1918" height="918" alt="08-private-route-table" src="https://github.com/user-attachments/assets/131ede01-018f-49eb-a0f4-d436bb892224" />

---

### Internet Gateway


<img width="1918" height="930" alt="10-internet-gateway" src="https://github.com/user-attachments/assets/b171a32a-0751-445c-894f-30a23288084e" />


---

### Security Groups



<img width="1918" height="928" alt="12-jenkins-security-group" src="https://github.com/user-attachments/assets/881b2960-6587-47d5-885f-ecdf781570ec" />


---

### Jenkins EC2 Instance


<img width="1918" height="917" alt="15-jenkins-ec2-details" src="https://github.com/user-attachments/assets/30357a01-4ce7-43f2-8ec5-e6f1ae2e16a7" />


---

### Amazon EKS Cluster


<img width="1893" height="921" alt="16-eks-cluster-overview" src="https://github.com/user-attachments/assets/cffd5d1e-5eb1-49a0-892e-098fa55abc52" />



---

### Amazon EKS Node Group


<img width="1892" height="918" alt="18-eks-node-group-details" src="https://github.com/user-attachments/assets/7b8dafe0-ed9a-4535-a671-4b3a15f2b3be" />



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

---

## ArgoCD Note

ArgoCD integration was tested on the EKS cluster.

However, due to AWS Free Tier limitations (`t3.micro` worker nodes), continuous ArgoCD operation was not maintained in the final deployment.

The deployment currently relies on Jenkins CI/CD and Kubernetes rolling deployments.

---

* Multi-environment deployment supportterraform plan
terraform apply
```
