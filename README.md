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
| IAM | ⏳ |
| EC2 | ⏳ |
| Application Load Balancer | ⏳ |
| Auto Scaling Group | ⏳ |
| S3 | ⏳ |
| CloudWatch | ⏳ |

## Repository Structure

```text
terraform-aws-platform/
├── modules/
│   ├── vpc/
│   └── security-group/
├── examples/
│   ├── vpc/
│   └── security-group/
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
- Dynamic Infrastructure as Code
- Production-ready examples
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
| IAM Module | ⏳ |
| EC2 Module | ⏳ |
| Application Load Balancer Module | ⏳ |
| Auto Scaling Group Module | ⏳ |
| S3 Module | ⏳ |
| CloudWatch Module | ⏳ |

## Current Architecture

### VPC Module

- Public Subnet
- Private Subnet
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

## Quality Assurance

Every module includes:

- Reusable Terraform module
- Example deployment
- Architecture diagram
- terraform-docs documentation
- Terraform validation
- tflint validation
- GitHub Actions
- pre-commit hooks

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) before submitting changes.

## License

This project is licensed under the MIT License.
