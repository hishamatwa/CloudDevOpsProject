# Terraform Setup

## Overview

Terraform is used to provision the AWS infrastructure for the project using reusable modules.

The infrastructure includes:

- VPC
- Public Subnet
- Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- Network ACL
- Jenkins EC2 Instance
- Amazon EKS Cluster
- Amazon ECR
- S3 Remote Backend

---

# Terraform Structure

```text
terraform/
├── environments/
├── modules/
│   ├── network/
│   ├── jenkins-server/
│   ├── eks/
│   └── ecr/
├── providers.tf
├── variables.tf
├── outputs.tf
└── versions.tf
```

---

# Initialize Terraform

```bash
terraform init
```

---

# Validate Configuration

```bash
terraform validate
```

---

# Preview Infrastructure Changes

```bash
terraform plan
```

---

# Apply Infrastructure

```bash
terraform apply
```

---

# Terraform Modules

## Network Module

Responsible for provisioning:

- VPC
- Public Subnet
- Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- Network ACL

---

## Jenkins Server Module

Responsible for provisioning:

- Jenkins EC2 Instance
- Security Group

---

## EKS Module

Responsible for provisioning:

- Amazon EKS Cluster
- Worker Nodes
- IAM Roles

---

## ECR Module

Responsible for provisioning:

- Amazon ECR Repository

---

# Remote Backend

Terraform remote state is stored in Amazon S3 backend with versioning enabled.

---

# Benefits of Terraform in This Project

- Infrastructure as Code
- Reusable Modules
- Automated Infrastructure Provisioning
- Version Controlled Infrastructure
- Scalable Architecture

