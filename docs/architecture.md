# Architecture Overview

## High-Level Architecture

This project implements a complete DevOps workflow that provisions AWS infrastructure, configures a Jenkins server, builds and scans Docker images, stores images in Amazon ECR, and deploys the application to Kubernetes using ArgoCD GitOps.

```mermaid
flowchart LR
    Dev[Developer] --> GH[GitHub Repository]
    GH --> Jenkins[Jenkins CI Pipeline]
    Jenkins --> Docker[Docker Build]
    Docker --> Trivy[Trivy Image Scan]
    Trivy --> ECR[Amazon ECR]
    Jenkins --> Update[Update Kubernetes Manifests]
    Update --> GH
    GH --> ArgoCD[ArgoCD]
    ArgoCD --> EKS[Amazon EKS Cluster]
    EKS --> Pods[Application Pods]
```

---

## AWS Infrastructure Architecture

Terraform provisions the AWS infrastructure using reusable modules.

```mermaid
flowchart TB
    AWS[AWS Cloud] --> VPC[VPC: cloud-devops-vpc]

    VPC --> Public[Public Subnet]
    VPC --> Private1[Private Subnet 1]
    VPC --> Private2[Private Subnet 2]
    VPC --> Private3[Private Subnet 3]

    Public --> Jenkins[Jenkins EC2 Instance]
    Public --> NAT[NAT Gateway]
    VPC --> IGW[Internet Gateway]

    Private1 --> Node1[EKS Worker Node 1]
    Private2 --> Node2[EKS Worker Node 2]
    Private3 --> Node3[EKS Worker Node 3]

    Jenkins --> ECR[Amazon ECR]
    Node1 --> EKS[EKS Cluster]
    Node2 --> EKS
    Node3 --> EKS
```

---

## Kubernetes Architecture

The application is deployed into a dedicated Kubernetes namespace.

```mermaid
flowchart TB
    User[User Request] --> Ingress[Ingress]
    Ingress --> Service[Service: cloud-devops-service]
    Service --> Deployment[Deployment: cloud-devops-app]
    Deployment --> Pod1[Pod 1]
    Deployment --> Pod2[Pod 2]
    Deployment --> Pod3[Pod 3]
    Deployment --> Pod4[Pod 4]
```

---

## CI/CD Workflow

1. Developer pushes code to GitHub.
2. Jenkins pipeline starts.
3. Jenkins builds the Docker image.
4. Trivy scans the image for vulnerabilities.
5. Jenkins pushes the image to Amazon ECR.
6. Jenkins updates the Kubernetes deployment manifest with the new image tag.
7. Jenkins pushes the updated manifest back to GitHub.
8. ArgoCD detects the Git change.
9. ArgoCD syncs the application to the Kubernetes cluster.

---

## Tools Responsibilities

| Tool | Responsibility |
|---|---|
| Terraform | Provision AWS infrastructure |
| Ansible | Configure Jenkins EC2 server |
| Docker | Containerize the application |
| Jenkins | Continuous Integration pipeline |
| Trivy | Security scan Docker images |
| Amazon ECR | Store Docker images |
| Kubernetes | Run application containers |
| ArgoCD | Continuous Deployment using GitOps |
| GitHub | Source code and manifests repository |
