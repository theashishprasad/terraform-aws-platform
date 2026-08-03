# Auto Scaling Group Module

Reusable Terraform module for provisioning an AWS Auto Scaling Group (ASG) using a Launch Template following Infrastructure as Code and Platform Engineering best practices.

---

## Features

- Launch Template
- Auto Scaling Group
- Target Tracking Scaling Policy
- CPU-based Auto Scaling
- ALB Target Group Attachment
- Instance Refresh
- EC2 & ELB Health Checks
- IAM Instance Profile
- User Data
- Configurable Root Volume
- IMDSv2 Enabled
- Detailed Monitoring
- Consistent Resource Tagging
- Terraform 1.6+
- AWS Provider 6.x

---

## Architecture

![ASG Module Architecture](../../docs/architecture/asg-module.png)

---

## Usage

```hcl
module "asg" {
  source = "../../modules/asg"

  ami_id           = "ami-0123456789abcdef0"
  instance_type    = "t3.micro"
  instance_profile = "ec2-instance-profile"

  security_group_ids = [
    "sg-0123456789abcdef0"
  ]

  private_subnet_ids = [
    "subnet-0123456789abcdef0",
    "subnet-abcdef01234567890"
  ]

  target_group_arns = [
    "arn:aws:elasticloadbalancing:ap-south-1:123456789012:targetgroup/web-tg/xxxxxxxx"
  ]

  desired_capacity = 2
  minimum_size     = 2
  maximum_size     = 4

  cpu_utilization_target = 70

  health_check_type = "ELB"

  user_data = <<-EOF
#!/bin/bash
echo "Hello World"
EOF

  project     = "terraform-aws-platform"
  environment = "dev"

  tags = {
    ManagedBy = "Terraform"
  }
}
```

---

A complete working example is available in:

```text
examples/asg/
```

---

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 6.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [aws_autoscaling_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_autoscaling_policy.target_tracking](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_policy) | resource |
| [aws_launch_template.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | AMI ID used by the Launch Template. | `string` | n/a | yes |
| <a name="input_cpu_utilization_target"></a> [cpu\_utilization\_target](#input\_cpu\_utilization\_target) | Average CPU utilization target. | `number` | `70` | no |
| <a name="input_desired_capacity"></a> [desired\_capacity](#input\_desired\_capacity) | Desired number of instances. | `number` | `2` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Deployment environment. | `string` | n/a | yes |
| <a name="input_health_check_grace_period"></a> [health\_check\_grace\_period](#input\_health\_check\_grace\_period) | Health check grace period. | `number` | `300` | no |
| <a name="input_health_check_type"></a> [health\_check\_type](#input\_health\_check\_type) | Health check type. | `string` | `"EC2"` | no |
| <a name="input_instance_profile"></a> [instance\_profile](#input\_instance\_profile) | IAM Instance Profile name. | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | EC2 instance type. | `string` | n/a | yes |
| <a name="input_maximum_size"></a> [maximum\_size](#input\_maximum\_size) | Maximum ASG size. | `number` | `4` | no |
| <a name="input_minimum_size"></a> [minimum\_size](#input\_minimum\_size) | Minimum ASG size. | `number` | `2` | no |
| <a name="input_private_subnet_ids"></a> [private\_subnet\_ids](#input\_private\_subnet\_ids) | Private subnet IDs. | `list(string)` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Project name. | `string` | n/a | yes |
| <a name="input_root_volume_size"></a> [root\_volume\_size](#input\_root\_volume\_size) | Root EBS volume size in GB. | `number` | `20` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | Security Group IDs. | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional resource tags. | `map(string)` | `{}` | no |
| <a name="input_target_group_arns"></a> [target\_group\_arns](#input\_target\_group\_arns) | Target Group ARNs. | `list(string)` | `[]` | no |
| <a name="input_termination_policies"></a> [termination\_policies](#input\_termination\_policies) | Termination policies. | `list(string)` | <pre>[<br/>  "OldestInstance"<br/>]</pre> | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | User data script. | `string` | `""` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_autoscaling_group_arn"></a> [autoscaling\_group\_arn](#output\_autoscaling\_group\_arn) | ARN of the Auto Scaling Group. |
| <a name="output_autoscaling_group_id"></a> [autoscaling\_group\_id](#output\_autoscaling\_group\_id) | ID of the Auto Scaling Group. |
| <a name="output_autoscaling_group_name"></a> [autoscaling\_group\_name](#output\_autoscaling\_group\_name) | Name of the Auto Scaling Group. |
| <a name="output_autoscaling_policy_arn"></a> [autoscaling\_policy\_arn](#output\_autoscaling\_policy\_arn) | ARN of the Target Tracking Scaling Policy. |
| <a name="output_launch_template_arn"></a> [launch\_template\_arn](#output\_launch\_template\_arn) | ARN of the Launch Template. |
| <a name="output_launch_template_id"></a> [launch\_template\_id](#output\_launch\_template\_id) | ID of the Launch Template. |
| <a name="output_launch_template_latest_version"></a> [launch\_template\_latest\_version](#output\_launch\_template\_latest\_version) | Latest version of the Launch Template. |
<!-- END_TF_DOCS -->

---

## Validation

Generate documentation:

```bash
terraform-docs markdown table . --output-file README.md
```

Validate the module:

```bash
terraform fmt
```

```bash
terraform validate
```

---

## Best Practices

- Deploy across multiple private subnets.
- Use Target Tracking Scaling instead of Step Scaling for common workloads.
- Attach the ASG to an ALB Target Group.
- Enable Instance Refresh for rolling deployments.
- Enable IMDSv2 and detailed monitoring.
- Use health checks appropriate to the workload (`ELB` for load-balanced services).
- Reuse outputs from the VPC, Security Group, IAM, EC2, and ALB modules.

---

## Integration

This module is designed to work together with:

- VPC Module
- Security Group Module
- IAM Module
- EC2 Module
- Application Load Balancer Module

---

## Outputs

The module exports:

- Launch Template ID
- Launch Template ARN
- Launch Template Latest Version
- Auto Scaling Group ID
- Auto Scaling Group Name
- Auto Scaling Group ARN
- Target Tracking Scaling Policy ARN
