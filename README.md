# Terraform AWS Platform

Production-ready Terraform modules for building secure, scalable, and reusable AWS infrastructure following Platform Engineering best practices.

## Overview

This repository contains reusable Terraform modules for AWS infrastructure. Each module follows Infrastructure as Code (IaC) best practices and includes documentation, working examples, architecture diagrams, and automated validation.

The repository is being developed incrementally as a Platform Engineering portfolio project demonstrating production-quality Infrastructure as Code.

## Current Modules

| Module | Status |
|---------|:------:|
| VPC | ✅ |
| Security Group | ✅ |
| IAM | ✅ |
| EC2 | ✅ |
| Application Load Balancer | ✅ |
| Auto Scaling Group | ⏳ |
| S3 | ⏳ |
| CloudWatch | ⏳ |

## Repository Structure

```text
terraform-aws-platform/
├── modules/
│   ├── vpc/
│   ├── security-group/
│   ├── iam/
│   ├── ec2/
│   └── alb/
├── examples/
│   ├── vpc/
│   ├── security-group/
│   ├── iam/
│   ├── ec2/
│   └── alb/
├── docs/
│   └── architecture/
├── .github/
└── README.md
```

## Tooling

- Terraform
- AWS Provider
- GitHub Actions
- pre-commit
- terraform-docs
- tflint

## Repository Features

- Reusable Terraform modules
- Production-ready Infrastructure as Code
- Modular architecture
- Dynamic resource configuration
- Example deployments
- Automated validation
- Generated module documentation
- Architecture diagrams
- Conventional Commits
- Semantic Versioning

## Roadmap

| Milestone | Status |
|-----------|:------:|
| Repository Foundation | ✅ |
| VPC Module | ✅ |
| Security Group Module | ✅ |
| IAM Module | ✅ |
| EC2 Module | ✅ |
| Application Load Balancer Module | ✅ |
| Auto Scaling Group Module | ⏳ |
| S3 Module | ⏳ |
| CloudWatch Module | ⏳ |

## Current Architecture

### VPC Module

- Public Subnets
- Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables

### Security Group Module

- Dynamic Ingress Rules
- Dynamic Egress Rules
- Security Group References
- Web Security Group
- Application Security Group
- Database Security Group

### IAM Module

- IAM Roles
- Managed Policy Attachments
- Optional Custom IAM Policies
- Optional EC2 Instance Profiles
- EC2 IAM Role Example
- S3 Read Role Example
- CloudWatch Agent Role Example

### EC2 Module

- EC2 Instance
- User Data
- IAM Instance Profile
- Security Groups
- Root Volume
- Additional Volume
- Optional Elastic IP

### Application Load Balancer Module

- Application Load Balancer
- Target Groups
- HTTP Listener
- HTTPS Listener
- HTTP → HTTPS Redirect
- Health Checks
- Target Group Attachments

## Quality Assurance

Every module includes:

- Reusable Terraform module
- Example deployment
- Architecture diagram
- terraform-docs documentation
- Terraform validation
- Terraform plan verification
- tflint validation
- GitHub Actions
- pre-commit hooks

## Versioning

This repository follows Semantic Versioning.

| Version | Milestone |
|---------|-----------|
| v0.1.0 | Repository Foundation |
| v0.2.0 | VPC Module |
| v0.3.0 | Security Group Module |
| v0.4.0 | IAM Module |
| v0.5.0 | EC2 Module |
| v0.6.0 | Application Load Balancer Module |

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) before submitting changes.

## License

This project is licensed under the MIT License.
