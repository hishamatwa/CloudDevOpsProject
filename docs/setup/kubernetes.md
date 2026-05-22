# Kubernetes Setup

## Overview

Kubernetes is used to orchestrate and manage the containerized application.

The application deployment includes:

- Namespace
- Deployment
- Service
- Ingress

---

# Kubernetes Structure

```text
kubernetes/
├── base/
│   ├── namespace.yaml
│   ├── deployment.yaml
│   └── service.yaml
└── ingress/
    └── ingress.yaml
```

---

# Namespace

The application is deployed inside a dedicated namespace called:

```text
ivolve
```

---

# Deployment

The deployment is responsible for:

- Running application pods
- Managing replicas
- Self-healing failed pods
- Scaling the application

The deployment uses:

- Docker image
- 4 replicas
- Container port 5000

---

# Service

The Kubernetes service provides internal communication and load balancing between application pods.

Service type used:

```text
ClusterIP
```

---

# Ingress

Ingress exposes the application externally and routes traffic to the Kubernetes service.

The ingress configuration uses:

- Host-based routing
- Prefix path routing

---

# Apply Kubernetes Manifests

```bash
kubectl apply -f kubernetes/base/
kubectl apply -f kubernetes/ingress/
```

---

# Verify Resources

```bash
kubectl get namespaces
kubectl get deployments -n ivolve
kubectl get services -n ivolve
kubectl get ingress -n ivolve
kubectl get pods -n ivolve
```

---

# Kubernetes Workflow

```text
Ingress
↓
Service
↓
Deployment
↓
Pods
```

---

# Benefits of Kubernetes in This Project

- Container Orchestration
- High Availability
- Self-Healing
- Scalability
- Automated Deployment Management
