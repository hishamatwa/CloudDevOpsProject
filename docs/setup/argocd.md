# ArgoCD Setup

## Overview

ArgoCD is used to implement Continuous Deployment (CD) using GitOps principles.

ArgoCD continuously monitors the GitHub repository and automatically synchronizes Kubernetes manifests with the Kubernetes cluster.

---

# ArgoCD Structure

```text
argocd/
└── application.yaml
```

---

# GitOps Workflow

```text
Developer Push
↓
GitHub Repository
↓
Jenkins Updates Kubernetes Manifests
↓
GitHub Repository
↓
ArgoCD Detects Changes
↓
Deploy Changes to Kubernetes Cluster
```

---

# ArgoCD Application

The project uses an ArgoCD Application manifest to define:

- GitHub repository source
- Kubernetes manifests path
- Destination Kubernetes cluster
- Target namespace
- Automated synchronization policy

---

# ArgoCD Application Manifest

```text
argocd/application.yaml
```

---

# ArgoCD Sync Features

## Automated Sync

ArgoCD automatically applies changes from GitHub to Kubernetes.

---

## Self-Healing

If manual changes occur inside the Kubernetes cluster, ArgoCD restores the cluster state from GitHub.

---

## Pruning

If resources are removed from GitHub, ArgoCD removes them from the Kubernetes cluster automatically.

---

# Apply ArgoCD Application

```bash
kubectl apply -f argocd/application.yaml
```

---

# Verify ArgoCD Application

```bash
kubectl get applications -n argocd
```

---

# Benefits of ArgoCD in This Project

- GitOps Continuous Deployment
- Automated Kubernetes Synchronization
- Self-Healing Infrastructure
- Version Controlled Deployments
- Reduced Manual Kubernetes Operations

