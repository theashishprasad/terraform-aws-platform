#################################################
# CloudWatch Example
#################################################

module "cpu_alarm" {
  source = "../../modules/cloudwatch"

  #################################################
  # Log Group
  #################################################

  log_group_name    = "/aws/ec2/web-server"
  retention_in_days = 30

  #################################################
  # Metric Alarm
  #################################################

  alarm_name          = "web-server-cpu-utilization"
  alarm_description   = "Alarm when EC2 CPU utilization exceeds 80%."
  comparison_operator = "GreaterThanOrEqualToThreshold"

  evaluation_periods = 2

  metric_name = "CPUUtilization"

  namespace = "AWS/EC2"

  period = 300

  statistic = "Average"

  threshold = 80

  dimensions = {
    InstanceId = "i-0123456789abcdef0"
  }

  treat_missing_data = "missing"

  actions_enabled = true

  alarm_actions = [
    "arn:aws:sns:us-east-1:123456789012:cloudwatch-alerts"
  ]

  ok_actions = [
    "arn:aws:sns:us-east-1:123456789012:cloudwatch-alerts"
  ]

  insufficient_data_actions = []

  #################################################
  # Dashboard
  #################################################

  create_dashboard = true

  dashboard_name = "web-server-dashboard"

  dashboard_body = jsonencode({
    widgets = []
  })

  #################################################
  # Common
  #################################################

  project     = var.project
  environment = var.environment
  tags        = var.tags
}
