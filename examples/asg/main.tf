#################################################
# Auto Scaling Group Example
#################################################

module "web_application_asg" {
  source = "../../modules/asg"

  ami_id           = var.ami_id
  instance_type    = var.instance_type
  instance_profile = var.instance_profile

  security_group_ids = var.security_group_ids

  private_subnet_ids = var.private_subnet_ids

  target_group_arns = var.target_group_arns

  desired_capacity = 2
  minimum_size     = 2
  maximum_size     = 4

  cpu_utilization_target = 70

  health_check_type         = "ELB"
  health_check_grace_period = 300

  root_volume_size = 20

  user_data = <<-EOF
#!/bin/bash
echo "Terraform AWS Platform"
EOF

  termination_policies = [
    "OldestInstance"
  ]

  project     = var.project
  environment = var.environment
  tags        = var.tags
}
