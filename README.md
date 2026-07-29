# Terraform AWS Platform

Production-ready Terraform modules for building secure, scalable, and reusable AWS infrastructure following Platform Engineering best practices.

## Overview

This repository contains reusable Terraform modules for AWS infrastructure. Each module follows Infrastructure as Code (IaC) best practices and includes documentation, working examples, and automated validation.

The repository is being developed incrementally as a Platform Engineering portfolio project.

## Current Modules

| Module | Status |
|---------|:------:|
| VPC | ✅ |
| Security Groups | ⏳ |
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
│   └── vpc/
├── examples/
│   └── vpc/
├── docs/
│   └── architecture/
├── .github/
└── README.md
```

## Tooling

- Terraform
- GitHub Actions
- pre-commit
- terraform-docs
- tflint

## Roadmap

- ✅ Repository Foundation
- ✅ VPC Module
- ⏳ Security Group Module
- ⏳ IAM Module
- ⏳ EC2 Module
- ⏳ Application Load Balancer Module
- ⏳ Auto Scaling Group Module
- ⏳ S3 Module
- ⏳ CloudWatch Module

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT License.
