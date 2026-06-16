# azure-security-compliance-terraform
Automated Security Compliance Framework using Azure Policy and Terraform to enforce governance, tagging standards, location restrictions, and secure storage configurations.

# Project 5: Automated Security Compliance using Azure Policy & Terraform

## Overview

This project demonstrates how to implement an automated security and compliance framework in Microsoft Azure using Azure Policy and Terraform. The solution enforces organizational governance standards, prevents non-compliant resource deployments, and provides centralized compliance monitoring across an Azure subscription.

## Objective

The primary objective of this project is to automate security governance by:

* Restricting resource deployment locations
* Enforcing mandatory resource tagging
* Preventing insecure storage configurations
* Centralizing policy management through Azure Policy Initiatives
* Monitoring compliance across Azure resources

---

## Architecture

```text
Terraform
    ↓
Azure Policy Definitions
    ↓
Policy Assignments
    ↓
Security Compliance Initiative
    ↓
Azure Policy Engine
    ↓
Resource Evaluation
    ↓
Compliance Reporting
```

### Policies Implemented

| Policy                    | Purpose                                                   |
| ------------------------- | --------------------------------------------------------- |
| Allowed Location Policy   | Restricts resource deployment to Canada Central           |
| Required Owner Tag Policy | Ensures all resources contain an Owner tag                |
| Secure Storage Policy     | Prevents Storage Accounts with Public Blob Access enabled |

---

## Technologies Used

* Microsoft Azure
* Azure Policy
* Terraform
* Azure CLI
* Visual Studio Code
* Git & GitHub

---

## Project Structure

```text
Project-5-Security-Compliance
│
├── docs/
│
├── policies/
│   ├── allowed_location.json
│   ├── required_tags.json
│   └── secure_storage.json
│
├── terraform/
│   ├── provider.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   ├── main.tf
│   ├── outputs.tf
│   ├── policy-assignments.tf
│   ├── policy-initiative.tf
│   └── terraform.tfstate
│
└── README.md
```

---

## Implementation Steps

### Step 1: Configure Terraform Provider

Configured AzureRM provider and authenticated Terraform against Azure Subscription.

### Step 2: Create Custom Azure Policies

Created the following custom policy definitions:

#### Allowed Location Policy

Restricts deployment of resources outside Canada Central.

#### Required Owner Tag Policy

Requires all Azure resources to contain an Owner tag.

#### Secure Storage Policy

Denies creation of Azure Storage Accounts with Public Blob Access enabled.

### Step 3: Assign Policies

Assigned policies at the subscription scope using Terraform and Azure CLI.

### Step 4: Create Policy Initiative

Created a Security Compliance Initiative that groups all policies into a single governance package.

### Step 5: Validate Compliance

Used Azure Policy compliance reporting commands to evaluate resources against assigned policies.

---

## Validation Tests

### Test 1: Location Restriction

Attempted to create a Resource Group in East US.

Expected Result:

```text
RequestDisallowedByPolicy
```

Result:

✅ Successfully blocked by Azure Policy

---

### Test 2: Missing Owner Tag

Attempted to deploy resources without Owner tag.

Expected Result:

```text
NonCompliant
```

Result:

✅ Resource identified as non-compliant

---

### Test 3: Public Storage Access

Attempted to configure a Storage Account with Public Blob Access enabled.

Expected Result:

```text
Denied
```

Result:

✅ Security policy enforced successfully

---

## Compliance Monitoring

### List Policies

```bash
az policy definition list -o table
```

### List Assignments

```bash
az policy assignment list -o table
```

### View Compliance State

```bash
az policy state list -o table
```

### Summarize Compliance

```bash
az policy state summarize
```

---

## Challenges Faced

### Issue 1: Azure Policy Assignment Timeout

Error:

```text
HTTP response was nil
ConnectionResetError(10054)
```

Resolution:

* Created policy assignments using Azure CLI
* Imported assignments into Terraform state using terraform import
* Verified Terraform state synchronization

### Issue 2: Policy Definition Timeout

Error:

```text
context deadline exceeded
```

Resolution:

* Used terraform apply -refresh=false
* Verified Azure Policy creation through Azure CLI
* Imported resources when necessary

---

## Key Learnings

* Azure Policy governance implementation
* Policy assignment and subscription-level enforcement
* Policy Initiatives for centralized management
* Terraform state management and resource import
* Compliance auditing and reporting
* Infrastructure as Code (IaC) best practices

---

## Outcome

Successfully implemented an automated Azure governance framework capable of:

* Enforcing location restrictions
* Ensuring resource ownership accountability
* Securing storage account configurations
* Monitoring compliance automatically
* Providing governance visibility across Azure subscriptions

This solution demonstrates how Infrastructure as Code (Terraform) and Azure Policy can work together to establish enterprise-grade security and compliance controls.
