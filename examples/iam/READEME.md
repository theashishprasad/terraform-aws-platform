# IAM Module Example

This example demonstrates how to use the reusable IAM module to provision common AWS IAM resources.

## Resources Created

This example creates three IAM roles:

- EC2 IAM Role
- S3 Read Role
- CloudWatch Agent Role

Depending on the configuration, the module also creates:

- IAM Roles
- Managed Policy Attachments
- EC2 Instance Profiles

## Architecture

![IAM Module Architecture](../../docs/architecture/iam-module.png)

---

## Usage

Initialize Terraform:

```bash
terraform init
```

Validate the configuration:

```bash
terraform validate
```

Review the execution plan:

```bash
terraform plan
```

Apply the configuration:

```bash
terraform apply
```

Destroy the resources:

```bash
terraform destroy
```

---

## Example Configuration

Copy the example variables file:

```bash
cp terraform.tfvars.example terraform.tfvars
```

Then edit the values as required.

---

## Module Demonstrations

### EC2 IAM Role

- AmazonSSMManagedInstanceCore
- Instance Profile enabled

### S3 Read Role

- AmazonS3ReadOnlyAccess
- Instance Profile disabled

### CloudWatch Agent Role

- CloudWatchAgentServerPolicy
- Instance Profile enabled

---

## Expected Resources

- 3 IAM Roles
- 3 Managed Policy Attachments
- 2 IAM Instance Profiles

---

## Cleanup

```bash
terraform destroy
```
