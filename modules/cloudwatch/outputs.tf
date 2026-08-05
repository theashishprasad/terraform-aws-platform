#################################################
# Log Group
#################################################

output "log_group_id" {
  description = "ID of the CloudWatch Log Group."

  value = aws_cloudwatch_log_group.main.id
}

output "log_group_arn" {
  description = "ARN of the CloudWatch Log Group."

  value = aws_cloudwatch_log_group.main.arn
}

#################################################
# Metric Alarm
#################################################

output "metric_alarm_id" {
  description = "ID of the CloudWatch Metric Alarm."

  value = aws_cloudwatch_metric_alarm.main.id
}

output "metric_alarm_arn" {
  description = "ARN of the CloudWatch Metric Alarm."

  value = aws_cloudwatch_metric_alarm.main.arn
}

#################################################
# Dashboard
#################################################

output "dashboard_name" {
  description = "CloudWatch Dashboard name."

  value = var.create_dashboard ? aws_cloudwatch_dashboard.main[0].dashboard_name : null
}

output "dashboard_arn" {
  description = "CloudWatch Dashboard ARN."

  value = var.create_dashboard ? aws_cloudwatch_dashboard.main[0].dashboard_arn : null
}
