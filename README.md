# Azure Landing Zone — Terraform Deployment Pipeline

This repository implements a modular, multi‑environment Azure Landing Zone using Terraform and GitHub Actions.  
It supports **Dev**, **Test**, and **Prod** environments with isolated state, controlled promotion, and secure OIDC authentication.

---

## 🚀 Overview

This project provisions a foundational Azure Landing Zone including:

- Resource groups  
- Networking  
- Logging  
- Diagnostic settings  
- Environment‑specific configuration  
- Secure GitHub Actions CI/CD using Azure OIDC  

Each environment (`dev`, `test`, `prod`) is deployed independently using its own Terraform backend state and GitHub Actions workflow.

---

## 📁 Repository Structure
.
├── envs
│   ├── dev
│   ├── prod
│   └── test
├── modules
│   ├── diagnostic_settings
│   ├── logging
│   ├── network_watcher
│   ├── networking
│   ├── policy
│   └── resource_groups
├──.github
    └── workflows
        ├── dev.yml
        ├── test.yml
        └── prod.yml

### Key principles:
- **Modules** contain reusable infrastructure logic  
- **Environments** contain only configuration + backend + provider blocks  
- **Workflows** deploy each environment independently  

---

## 🔐 Authentication — Azure OIDC

All deployments use **GitHub → Azure OIDC** for passwordless authentication.

This eliminates:
- Service principals with secrets  
- Secret rotation  
- Credential leaks  

Each workflow logs into Azure using:

```yaml
uses: azure/login@v2
with:
  client-id: ${{ secrets.AZURE_CLIENT_ID }}
  tenant-id: ${{ secrets.AZURE_TENANT_ID }}
  subscription-id: ${{ secrets.AZURE_SUBSCRIPTION_ID }}

Dev Workflow (dev.yml)
Triggered by:
Pull requests into dev
Pushes to dev
Manual dispatch

Behaviour:
Runs terraform init + plan
Comments the plan on the PR
Automatically applies on push to dev

Purpose:
Fast iteration.
Developers get immediate feedback and automatic deployment after merge.

Test Workflow (test.yml)
Triggered by:
Pull requests into test
Pushes to test
Manual dispatch

Behaviour:
Runs terraform init + plan
Comments the plan on the PR
Apply requires GitHub Environment approval

Prod Workflow (prod.yml)

Triggered by:
Pull requests into main
Pushes to main
Manual dispatch

Behaviour:
Runs terraform init + plan
Comments the plan on the PR
Apply requires strict approval via GitHub Environments

Purpose:
Safe, auditable production deployments with mandatory human approval.

Terraform State Layout 
Each environment uses its own Azure Storage backend:
tfstate/dev.tfstate
tfstate/test.tfstate
tfstate/prod.tfstate

Promotion Flow

Feature branch → PR into dev

Plan runs

Dev auto‑applies on merge

Dev → PR into test

Plan runs

Test apply requires approval

Test → PR into main

Plan runs

Prod apply requires approval

Concurrency and Safety 

Each workflow uses 
concurrency:
  group: terraform-<env>
  cancel-in-progress: true

PR Plan Comments

###  Terraform Plan (Dev)
<details>
<summary>Click to expand</summary>

```hcl
<plan output>


This gives reviewers full visibility into infrastructure changes before approval.

---

## Requirements

- Terraform ≥ 1.6  
- AzureRM provider ≥ 3.x  
- GitHub OIDC configured  
- Azure Storage account for backend state  

---

## Summary

This repository implements a clean, modular, secure Azure Landing Zone with:

- Multi‑environment Terraform  
- OIDC‑based GitHub Actions  
- PR‑driven plans  
- Controlled promotion  
- Safe production deployment  

It is designed for clarity, maintainability, and enterprise‑grade governance.

<!-- BEGIN_TF_DOCS -->
## Providers

No providers.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->