CloudDevOpsProject
AWS EKS	Terraform IaC	Jenkins CI/CD	Kubernetes	Docker
End-to-end DevOps project deployed on AWS using Terraform, Ansible, Docker, Jenkins, Kubernetes, and Amazon EKS.

Project Overview
This project demonstrates a complete DevOps workflow starting from infrastructure provisioning to automated application deployment on Kubernetes.
Main Features
•	Infrastructure provisioning using Terraform
•	Jenkins CI/CD pipeline automation
•	Docker containerization
•	Amazon ECR image management
•	Kubernetes deployment on Amazon EKS
•	Rolling deployment updates
•	Configuration management using Ansible

Tech Stack
Category	Tools
Cloud Provider	AWS
Infrastructure as Code	Terraform
Configuration Management	Ansible
CI/CD	Jenkins
Containerization	Docker
Container Registry	Amazon ECR
Container Orchestration	Kubernetes / Amazon EKS
Application	Flask
Version Control	Git & GitHub

Project Workflow
GitHub → Jenkins → Docker Build → Amazon ECR → Amazon EKS → Flask Application

Infrastructure Provisioning
Terraform was used to provision:
•	Custom AWS VPC
•	Public and Private Subnets
•	Internet Gateway
•	NAT Gateway
•	Route Tables
•	Security Groups
•	Jenkins EC2 Server
•	Amazon EKS Cluster
•	EKS Worker Nodes
•	Amazon ECR Repository
Terraform Deployment
cd terraform/environments/dev

terraform init
terraform plan
terraform apply
 

Configuration Management
Ansible was used to configure the Jenkins EC2 instance and automate local cleanup operations.
Configure Jenkins
ansible-playbook ansible/playbooks/configure-jenkins.yml
Cleanup Generated Files
ansible-playbook ansible/playbooks/cleanup-local.yml

CI/CD Pipeline
The Jenkins pipeline automates the following workflow:
1.	Pull source code from GitHub
2.	Build Docker image
3.	Scan Docker image using Trivy
4.	Push image to Amazon ECR
5.	Update Kubernetes manifests
6.	Deploy application to Amazon EKS
7.	Perform rolling deployment updates
Successful Jenkins Pipeline
 

Docker Build Output
 

Amazon ECR Push Output
 

Kubernetes Deployment
The Flask application is deployed on Amazon EKS using Kubernetes manifests.
Deploy Application
kubectl apply -f kubernetes/base/
Verify Resources
kubectl get nodes
kubectl get pods -A
Kubernetes Nodes
 

Kubernetes Deployment
 

Updated Deployment Image
 

Running Application
 

AWS Infrastructure Screenshots
Amazon ECR Repository
 

ECR Image Details
 

Custom VPC
 

VPC Resource Map
 

NAT Gateway
 

Route Tables
 

Internet Gateway
 

Security Groups
 

Jenkins EC2 Instance
 

Amazon EKS Cluster
 

Amazon EKS Node Group
 

Usage Instructions
Clone Repository
git clone https://github.com/hishamatwa/CloudDevOpsProject.git

cd CloudDevOpsProject
Configure AWS CLI
aws configure
Deploy Infrastructure
cd terraform/environments/dev
terraform init
terraform apply
Configure Jenkins
ansible-playbook ansible/playbooks/configure-jenkins.yml
Deploy Kubernetes Resources
kubectl apply -f kubernetes/base/

Verification
The following checks were completed successfully:
•	Jenkins pipeline executed successfully
•	Docker image pushed to Amazon ECR
•	Amazon EKS cluster deployed successfully
•	Kubernetes pods running successfully
•	Rolling deployment updates completed successfully
•	Flask application accessible through Kubernetes service

Setup Documentation
Additional setup documentation is available inside:
docs/setup/
Included files:
•	terraform.md
•	ansible.md
•	kubernetes.md
•	jenkins.md
•	argocd.md

ArgoCD Note
ArgoCD integration was tested on the EKS cluster.
However, due to AWS Free Tier limitations (t3.micro worker nodes), continuous ArgoCD operation was not maintained in the final deployment.
The deployment currently relies on Jenkins CI/CD and Kubernetes rolling deployments.

