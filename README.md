# Terraform AWS Platform

Production-ready Terraform modules for building secure, scalable, and reusable AWS infrastructure following Platform Engineering best practices.

## Overview

This repository contains reusable Terraform modules for AWS infrastructure. Each module follows Infrastructure as Code (IaC) best practices and includes documentation, working examples, architecture diagrams, and automated validation.

The repository is being developed incrementally as a Platform Engineering portfolio project demonstrating production-quality Terraform modules.

---

## Current Modules

| Module | Status |
|---------|:------:|
| VPC | ✅ |
| Security Group | ✅ |
| IAM | ✅ |
| EC2 | ✅ |
| Application Load Balancer | ✅ |
| Auto Scaling Group | ✅ |
| S3 | ✅ |
| CloudWatch | ✅ |

---

## Repository Structure

```text
terraform-aws-platform/
├── modules/
│   ├── vpc/
│   ├── security-group/
│   ├── iam/
│   ├── ec2/
│   ├── alb/
│   ├── asg/
│   ├── s3/
│   └── cloudwatch/
├── examples/
│   ├── vpc/
│   ├── security-group/
│   ├── iam/
│   ├── ec2/
│   ├── alb/
│   ├── asg/
│   ├── s3/
│   └── cloudwatch/
├── docs/
│   └── architecture/
├── .github/
├── .pre-commit-config.yaml
└── README.md
```

---

## Tooling

- Terraform
- AWS Provider v6
- GitHub Actions
- pre-commit
- terraform-docs
- tflint

---

## Repository Features

- Reusable Terraform modules
- Production-ready Infrastructure as Code
- Modular architecture
- Secure-by-default resources
- Dynamic resource configuration
- Example deployments
- Generated module documentation
- Architecture diagrams
- Automated validation
- Conventional Commits
- Semantic Versioning

---

## Roadmap

| Milestone | Status |
|-----------|:------:|
| Repository Foundation | ✅ |
| VPC Module | ✅ |
| Security Group Module | ✅ |
| IAM Module | ✅ |
| EC2 Module | ✅ |
| Application Load Balancer Module | ✅ |
| Auto Scaling Group Module | ✅ |
| S3 Module | ✅ |
| CloudWatch Module | ✅ |

---

## Current Architecture

### VPC Module

- Public & Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables

### Security Group Module

- Dynamic Ingress Rules
- Dynamic Egress Rules
- IPv4 / IPv6 Support
- Security Group References

### IAM Module

- IAM Roles
- Managed Policy Attachments
- Optional Custom Policies
- Optional Instance Profiles

### EC2 Module

- EC2 Instance
- User Data
- IAM Instance Profile
- Root Volume
- Additional Volume
- Optional Elastic IP

### Application Load Balancer Module

- Application Load Balancer
- Target Groups
- HTTP / HTTPS Listeners
- HTTP Redirect
- Health Checks

### Auto Scaling Group Module

- Launch Template
- Auto Scaling Group
- Target Tracking Scaling Policy
- Target Group Attachment
- Instance Refresh
- Health Checks

### S3 Module

- S3 Bucket
- Bucket Versioning
- Server-side Encryption
- Lifecycle Rules
- Bucket Policy
- Public Access Block
- Access Logging

### CloudWatch Module

- CloudWatch Log Groups
- Metric Alarms
- CloudWatch Dashboards
- SNS Notifications
- Configurable Log Retention
- Metric Dimensions

---

## Quality Assurance

Every module includes:

- Reusable Terraform module
- Example deployment
- Architecture diagram
- terraform-docs documentation
- Terraform formatting
- Terraform validation
- Terraform plan verification
- tflint validation
- GitHub Actions
- pre-commit hooks

---

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
| v0.7.0 | Auto Scaling Group Module |
| v0.8.0 | S3 Module |
| v0.9.0 | CloudWatch Module |

---

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) before submitting changes.

---

## License

This project is licensed under the MIT License.
