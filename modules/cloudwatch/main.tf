locals {
  common_tags = merge(
    {
      Project     = var.project
      Environment = var.environment
    },
    var.tags
  )
}

#################################################
# CloudWatch Log Group
#################################################

resource "aws_cloudwatch_log_group" "main" {
  name              = var.log_group_name
  retention_in_days = var.retention_in_days

  tags = merge(
    local.common_tags,
    {
      Name = var.log_group_name
    }
  )
}

#################################################
# CloudWatch Metric Alarm
#################################################

resource "aws_cloudwatch_metric_alarm" "main" {
  alarm_name        = var.alarm_name
  alarm_description = var.alarm_description

  comparison_operator = var.comparison_operator
  evaluation_periods  = var.evaluation_periods

  metric_name = var.metric_name
  namespace   = var.namespace

  period    = var.period
  statistic = var.statistic
  threshold = var.threshold

  dimensions = var.dimensions

  treat_missing_data = var.treat_missing_data

  actions_enabled = var.actions_enabled

  alarm_actions             = var.alarm_actions
  ok_actions                = var.ok_actions
  insufficient_data_actions = var.insufficient_data_actions

  tags = merge(
    local.common_tags,
    {
      Name = var.alarm_name
    }
  )
}

#################################################
# CloudWatch Dashboard
#################################################

resource "aws_cloudwatch_dashboard" "main" {
  count = var.create_dashboard ? 1 : 0

  dashboard_name = var.dashboard_name
  dashboard_body = var.dashboard_body
}
