# Jenkins Setup

## Overview

Jenkins is used to automate the Continuous Integration (CI) pipeline for the project.

The Jenkins pipeline is responsible for:

- Building Docker images
- Scanning Docker images using Trivy
- Pushing images to Amazon ECR
- Updating Kubernetes manifests
- Pushing updated manifests to GitHub

---

# Jenkins Structure

```text
jenkins/
├── Jenkinsfile
└── vars/
    ├── dockerBuild.groovy
    ├── trivyScan.groovy
    ├── dockerPush.groovy
    └── dockerCleanup.groovy
```

---

# Jenkins Pipeline Workflow

```text
GitHub Push
↓
Jenkins Pipeline
↓
Docker Build
↓
Trivy Scan
↓
Push Image to Amazon ECR
↓
Update Kubernetes Manifest
↓
Push Changes to GitHub
```

---

# Jenkins Shared Libraries

The project uses reusable Groovy shared library functions stored inside:

```text
jenkins/vars/
```

These functions simplify the Jenkins pipeline and improve reusability.

---

# Shared Library Functions

## dockerBuild.groovy

Responsible for building Docker images.

---

## trivyScan.groovy

Responsible for scanning Docker images for vulnerabilities.

---

## dockerPush.groovy

Responsible for tagging and pushing Docker images to Amazon ECR.

---

## dockerCleanup.groovy

Responsible for removing local Docker images after pushing to ECR.

---

# Jenkins Pipeline Stages

## Build Image

Builds the Docker image.

---

## Scan Image

Scans the image using Trivy.

---

## Push Image

Pushes the Docker image to Amazon ECR.

---

## Delete Image Locally

Removes unused local Docker images.

---

## Update Manifests

Updates the Kubernetes deployment image tag automatically.

---

## Push Manifests

Pushes updated manifests back to GitHub.

---

# Benefits of Jenkins in This Project

- CI Automation
- Automated Docker Builds
- Automated Security Scanning
- GitOps Workflow Integration
- Reduced Manual Deployment Steps
