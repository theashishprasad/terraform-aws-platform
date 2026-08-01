# EC2 Module

Reusable Terraform module for provisioning AWS EC2 instances following Infrastructure as Code and Platform Engineering best practices.

---

## Features

- EC2 Instance
- Configurable AMI
- Configurable Instance Type
- User Data Support
- IAM Instance Profile
- Security Group Association
- Configurable Root GP3 Volume
- Optional Additional GP3 Volume
- Optional Elastic IP
- Consistent Resource Tagging
- Terraform 1.6+
- AWS Provider 6.x

---

## Architecture

![EC2 Module Architecture](../../docs/architecture/ec2-module.png)

---

## Usage

```hcl
module "ec2" {
  source = "../../modules/ec2"

  ami_id        = "ami-xxxxxxxxxxxxxxxxx"
  instance_type = "t3.micro"

  subnet_id = "subnet-xxxxxxxx"

  security_group_ids = [
    "sg-xxxxxxxx"
  ]

  instance_profile = "ec2-instance-profile"

  key_pair = "terraform-key"

  user_data = file("user-data.sh")

  associate_public_ip = true

  root_volume_size = 20

  create_additional_volume = true

  additional_volume_size = 40

  create_elastic_ip = true

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
examples/ec2/
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
| [aws_ebs_volume.additional](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ebs_volume) | resource |
| [aws_eip.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_eip_association.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip_association) | resource |
| [aws_instance.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_volume_attachment.additional](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/volume_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_additional_volume_size"></a> [additional\_volume\_size](#input\_additional\_volume\_size) | Additional EBS volume size (GB). | `number` | `20` | no |
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | AMI ID for the EC2 instance. | `string` | n/a | yes |
| <a name="input_associate_public_ip"></a> [associate\_public\_ip](#input\_associate\_public\_ip) | Associate a public IP. | `bool` | `true` | no |
| <a name="input_create_additional_volume"></a> [create\_additional\_volume](#input\_create\_additional\_volume) | Create an additional EBS volume. | `bool` | `false` | no |
| <a name="input_create_elastic_ip"></a> [create\_elastic\_ip](#input\_create\_elastic\_ip) | Allocate and associate an Elastic IP. | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Deployment environment. | `string` | n/a | yes |
| <a name="input_instance_profile"></a> [instance\_profile](#input\_instance\_profile) | IAM Instance Profile. | `string` | `null` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | EC2 instance type. | `string` | `"t3.micro"` | no |
| <a name="input_key_pair"></a> [key\_pair](#input\_key\_pair) | EC2 Key Pair. | `string` | `null` | no |
| <a name="input_project"></a> [project](#input\_project) | Project name. | `string` | n/a | yes |
| <a name="input_root_volume_size"></a> [root\_volume\_size](#input\_root\_volume\_size) | Root EBS volume size (GB). | `number` | `20` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | List of Security Group IDs. | `list(string)` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Subnet ID. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional resource tags. | `map(string)` | `{}` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | User data script. | `string` | `""` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_additional_volume_id"></a> [additional\_volume\_id](#output\_additional\_volume\_id) | Additional EBS volume ID. |
| <a name="output_availability_zone"></a> [availability\_zone](#output\_availability\_zone) | Availability Zone of the EC2 instance. |
| <a name="output_elastic_ip"></a> [elastic\_ip](#output\_elastic\_ip) | Elastic IP address. |
| <a name="output_elastic_ip_allocation_id"></a> [elastic\_ip\_allocation\_id](#output\_elastic\_ip\_allocation\_id) | Elastic IP allocation ID. |
| <a name="output_instance_arn"></a> [instance\_arn](#output\_instance\_arn) | ARN of the EC2 instance. |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | ID of the EC2 instance. |
| <a name="output_private_dns"></a> [private\_dns](#output\_private\_dns) | Private DNS hostname. |
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | Private IPv4 address of the EC2 instance. |
| <a name="output_public_dns"></a> [public\_dns](#output\_public\_dns) | Public DNS hostname. |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | Public IPv4 address of the EC2 instance. |
| <a name="output_root_volume_id"></a> [root\_volume\_id](#output\_root\_volume\_id) | Root EBS volume ID. |
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

- Use the latest Amazon Linux or Ubuntu LTS AMIs.
- Prefer GP3 encrypted EBS volumes.
- Attach only the minimum required IAM permissions.
- Use Security Groups with least-privilege rules.
- Store user data scripts in version control.
- Allocate Elastic IPs only when required.
- Reuse this module with the VPC, Security Group, and IAM modules in this repository.

---

## Outputs

The module exports:

- Instance ID
- Instance ARN
- Private IP
- Public IP
- Availability Zone
- Public DNS
- Private DNS
- Root Volume ID
- Additional Volume ID (optional)
- Elastic IP (optional)
- Elastic IP Allocation ID (optional)
