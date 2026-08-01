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

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
| ---- | ------ | ------- |
| <a name="module_cloudwatch_agent_role"></a> [cloudwatch\_agent\_role](#module\_cloudwatch\_agent\_role) | ../../modules/iam | n/a |
| <a name="module_ec2_iam_role"></a> [ec2\_iam\_role](#module\_ec2\_iam\_role) | ../../modules/iam | n/a |
| <a name="module_s3_read_role"></a> [s3\_read\_role](#module\_s3\_read\_role) | ../../modules/iam | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_environment"></a> [environment](#input\_environment) | Deployment environment. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Project name. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags. | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
