# Security Group Example

This example demonstrates how to deploy multiple Security Groups using the reusable Security Group module.

## Resources Created

- Web Security Group
- Application Security Group
- Database Security Group

### Security Flow

```text
Internet
    │
    ▼
Web Security Group
    │
    ▼
Application Security Group
    │
    ▼
Database Security Group
```

The example demonstrates:

- Multiple module instances
- Security Group referencing
- Dynamic ingress rules
- Dynamic egress rules
- Consistent tagging

## Usage

```bash
terraform init
terraform plan
terraform apply
```

> **Note**
>
> Replace the placeholder VPC ID (`vpc-xxxxxxxx`) in `main.tf` with a valid VPC ID before applying.

## Cleanup

```bash
terraform destroy
```
