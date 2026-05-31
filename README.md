# Automated Bedrock Policy Injector & IAM Guardrail

[![Infrastructure](https://img.shields.io/badge/IaC-Terraform-blue.svg)](https://www.terraform.io/)
[![Security](https://img.shields.io/badge/IAM-Least%20Privilege-orange.svg)](https://aws.amazon.com/iam/)
[![AI Governance](https://img.shields.io/badge/Target-Amazon%20Bedrock-blueviolet.svg)](https://aws.amazon.com/bedrock/)

## 📋 Operational Overview

This repository provides an automated "Security-as-Code" utility designed to programmatically inject rigid IAM resource-based policies and VPC Interface Endpoints around Amazon Bedrock model deployments.

Standard AI deployments often suffer from "Identity Creep," where too many users have broad `bedrock:*` access. This engine enforces a zero-trust boundary by injecting scoped policies that restrict model invocation to specific authorized VPC CIDR blocks and explicitly denies access to un-approved foundation models (e.g., blocking high-cost or un-vetted third-party models).

---

### 🛡️ Core Security Controls Injected

* **Resource-Based Scoped Authorization:** Automatically restricts model invocation to a specific list of corporate-approved Foundation Model IDs.
* **VPC Endpoint Enforcement:** Ensures GenAI traffic never traverses the public internet by injecting mandatory Interface VPC Endpoint policies.
* **Service Control Policy (SCP) Simulation:** Implements a preventative layer that blocks model customization (fine-tuning) unless explicitly authorized by a security principal.

---

## 📂 Repository Structural Mapping
```text
automated-bedrock-policy-injector/
├── README.md                      # Governance and scaling overview
├── iam_policy_injector.tf         # Core Terraform logic for policy injection
├── bedrock_network_privacy.tf     # VPC Endpoint and PrivateLink configuration
└── variables.tf                   # Environment injection parameters
