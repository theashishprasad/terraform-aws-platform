locals {
  common_tags = merge(
    {
      Project     = var.project
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_launch_template" "main" {
  name_prefix            = "${var.project}-${var.environment}-"
  image_id               = var.ami_id
  instance_type          = var.instance_type
  update_default_version = true

  user_data = base64encode(var.user_data)

  iam_instance_profile {
    name = var.instance_profile
  }

  vpc_security_group_ids = var.security_group_ids

  monitoring {
    enabled = true
  }

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size           = var.root_volume_size
      volume_type           = "gp3"
      delete_on_termination = true
      encrypted             = true
    }
  }

  tag_specifications {
    resource_type = "instance"

    tags = merge(
      local.common_tags,
      {
        Name = "${var.project}-${var.environment}-instance"
      }
    )
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project}-${var.environment}-launch-template"
    }
  )
}

resource "aws_autoscaling_group" "main" {
  name = "${var.project}-${var.environment}-asg"

  min_size         = var.minimum_size
  max_size         = var.maximum_size
  desired_capacity = var.desired_capacity

  vpc_zone_identifier = var.private_subnet_ids

  health_check_type         = var.health_check_type
  health_check_grace_period = var.health_check_grace_period

  target_group_arns = var.target_group_arns

  termination_policies = var.termination_policies

  default_cooldown = 300

  launch_template {
    id      = aws_launch_template.main.id
    version = "$Latest"
  }

  instance_refresh {
    strategy = "Rolling"

    preferences {
      min_healthy_percentage = 50
    }
  }

  dynamic "tag" {
    for_each = merge(
      local.common_tags,
      {
        Name = "${var.project}-${var.environment}-asg"
      }
    )

    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}

resource "aws_autoscaling_policy" "target_tracking" {
  name = "${var.project}-${var.environment}-cpu-scaling"

  autoscaling_group_name = aws_autoscaling_group.main.name

  policy_type = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = var.cpu_utilization_target
  }
}
