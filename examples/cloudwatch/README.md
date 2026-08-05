# CloudWatch Example

This example demonstrates how to deploy AWS CloudWatch resources using the reusable CloudWatch module.

---

## Resources Created

- CloudWatch Log Group
- CloudWatch Metric Alarm
- CloudWatch Dashboard
- SNS Alarm Notification Integration

---

## Architecture

![CloudWatch Module Architecture](../../docs/architecture/cloudwatch-module.png)

---

## Usage

Copy the example variables:

```bash
cp terraform.tfvars.example terraform.tfvars
```

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

Deploy the infrastructure:

```bash
terraform apply
```

Destroy the infrastructure:

```bash
terraform destroy
```

---

## Example Deployment

This example provisions:

- CloudWatch Log Group
- CPU Utilization Alarm
- CloudWatch Dashboard
- SNS Alarm Notifications

---

## Integration

This example is intended to be used together with:

- EC2 Module
- Auto Scaling Group Module
- Application Load Balancer Module
- SNS Topic (existing)

Replace the placeholder values in `main.tf` with outputs from your infrastructure.

Example:

```hcl
dimensions = {
  InstanceId = module.ec2.instance_id
}

alarm_actions = [
  module.sns.topic_arn
]

ok_actions = [
  module.sns.topic_arn
]
```

---

## Expected Outputs

After deployment Terraform will display:

- CloudWatch Log Group ID
- CloudWatch Log Group ARN
- CloudWatch Metric Alarm ID
- CloudWatch Metric Alarm ARN
- CloudWatch Dashboard Name
- CloudWatch Dashboard ARN

---

## Validation

```bash
terraform fmt
terraform validate
terraform plan
```

---

## Cleanup

```bash
terraform destroy
```
