# Application Load Balancer Module

Reusable Terraform module for provisioning an AWS Application Load Balancer (ALB) following Infrastructure as Code and Platform Engineering best practices.

---

## Features

- Internet-facing or Internal ALB
- Target Group
- HTTP Listener
- Optional HTTPS Listener
- Optional HTTP → HTTPS Redirect
- Configurable Health Checks
- Target Group Attachments
- Support for Instance, IP and Lambda Targets
- Cross-Zone Load Balancing
- HTTP/2 Enabled
- Consistent Resource Tagging
- Terraform 1.6+
- AWS Provider 6.x

---

## Architecture

![ALB Module Architecture](../../docs/architecture/alb-module.png)

---

## Usage

```hcl
module "alb" {
  source = "../../modules/alb"

  alb_name = "web-alb"

  vpc_id = "vpc-xxxxxxxx"

  public_subnet_ids = [
    "subnet-aaaa",
    "subnet-bbbb"
  ]

  security_group_ids = [
    "sg-xxxxxxxx"
  ]

  target_ids = [
    "i-0123456789abcdef0"
  ]

  target_group_port     = 80
  target_group_protocol = "HTTP"
  target_type           = "instance"

  health_check_path = "/health"

  enable_https = true

  certificate_arn = "arn:aws:acm:ap-south-1:123456789012:certificate/xxxxxxxx"

  http_redirect = true

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
examples/alb/
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
| [aws_lb.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group_attachment.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_alb_name"></a> [alb\_name](#input\_alb\_name) | Name of the Application Load Balancer. | `string` | n/a | yes |
| <a name="input_certificate_arn"></a> [certificate\_arn](#input\_certificate\_arn) | ACM certificate ARN. | `string` | `null` | no |
| <a name="input_enable_deletion_protection"></a> [enable\_deletion\_protection](#input\_enable\_deletion\_protection) | Enable deletion protection. | `bool` | `false` | no |
| <a name="input_enable_https"></a> [enable\_https](#input\_enable\_https) | Enable HTTPS listener. | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Deployment environment. | `string` | n/a | yes |
| <a name="input_health_check_matcher"></a> [health\_check\_matcher](#input\_health\_check\_matcher) | Expected HTTP response codes. | `string` | `"200"` | no |
| <a name="input_health_check_path"></a> [health\_check\_path](#input\_health\_check\_path) | Health check path. | `string` | `"/"` | no |
| <a name="input_health_check_protocol"></a> [health\_check\_protocol](#input\_health\_check\_protocol) | Health check protocol. | `string` | `"HTTP"` | no |
| <a name="input_http_redirect"></a> [http\_redirect](#input\_http\_redirect) | Redirect HTTP requests to HTTPS. | `bool` | `false` | no |
| <a name="input_idle_timeout"></a> [idle\_timeout](#input\_idle\_timeout) | Idle timeout in seconds. | `number` | `60` | no |
| <a name="input_internal"></a> [internal](#input\_internal) | Whether the ALB is internal. | `bool` | `false` | no |
| <a name="input_project"></a> [project](#input\_project) | Project name. | `string` | n/a | yes |
| <a name="input_public_subnet_ids"></a> [public\_subnet\_ids](#input\_public\_subnet\_ids) | Public subnet IDs for the ALB. | `list(string)` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | Security group IDs attached to the ALB. | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional resource tags. | `map(string)` | `{}` | no |
| <a name="input_target_group_port"></a> [target\_group\_port](#input\_target\_group\_port) | Target group listener port. | `number` | `80` | no |
| <a name="input_target_group_protocol"></a> [target\_group\_protocol](#input\_target\_group\_protocol) | Target group protocol. | `string` | `"HTTP"` | no |
| <a name="input_target_ids"></a> [target\_ids](#input\_target\_ids) | Target resource IDs. | `list(string)` | `[]` | no |
| <a name="input_target_type"></a> [target\_type](#input\_target\_type) | Target type. | `string` | `"instance"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID where the ALB is deployed. | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_alb_arn"></a> [alb\_arn](#output\_alb\_arn) | ARN of the Application Load Balancer. |
| <a name="output_alb_dns_name"></a> [alb\_dns\_name](#output\_alb\_dns\_name) | DNS name of the Application Load Balancer. |
| <a name="output_alb_zone_id"></a> [alb\_zone\_id](#output\_alb\_zone\_id) | Hosted Zone ID of the Application Load Balancer. |
| <a name="output_http_listener_arn"></a> [http\_listener\_arn](#output\_http\_listener\_arn) | ARN of the HTTP Listener. |
| <a name="output_https_listener_arn"></a> [https\_listener\_arn](#output\_https\_listener\_arn) | ARN of the HTTPS Listener. |
| <a name="output_target_group_arn"></a> [target\_group\_arn](#output\_target\_group\_arn) | ARN of the Target Group. |
| <a name="output_target_group_name"></a> [target\_group\_name](#output\_target\_group\_name) | Name of the Target Group. |
<!-- END_TF_DOCS -->

---

## Validation

Generate documentation:

```bash
terraform-docs markdown table . --output-file README.md
```

Validate module:

```bash
terraform fmt
```

```bash
terraform validate
```

---

## Best Practices

- Deploy the ALB across at least two Availability Zones.
- Enable HTTPS in production using ACM certificates.
- Configure HTTP → HTTPS redirection.
- Use health checks that reflect application readiness.
- Prefer least-privilege Security Groups.
- Register targets dynamically from Auto Scaling Groups or EC2 modules.
- Reuse this module with the VPC, Security Group, and EC2 modules in this repository.

---

## Integration

This module is designed to work together with:

- VPC Module
- Security Group Module
- EC2 Module
- Auto Scaling Group Module (future milestone)

---

## Outputs

The module exports:

- ALB ARN
- ALB DNS Name
- Hosted Zone ID
- Target Group ARN
- Target Group Name
- HTTP Listener ARN
- HTTPS Listener ARN (optional)
