#################################################
# Log Group
#################################################

variable "log_group_name" {
  description = "Name of the CloudWatch Log Group."
  type        = string

  validation {
    condition     = length(trimspace(var.log_group_name)) > 0
    error_message = "Log group name cannot be empty."
  }
}

variable "retention_in_days" {
  description = "Retention period for CloudWatch logs."

  type = number

  default = 30
}

#################################################
# Metric Alarm
#################################################

variable "alarm_name" {
  description = "Name of the CloudWatch Metric Alarm."

  type = string

  validation {
    condition     = length(trimspace(var.alarm_name)) > 0
    error_message = "Alarm name cannot be empty."
  }
}

variable "alarm_description" {
  description = "Description of the CloudWatch Metric Alarm."

  type = string

  default = ""
}

variable "comparison_operator" {
  description = "Comparison operator."

  type = string

  validation {
    condition = contains(
      [
        "GreaterThanThreshold",
        "GreaterThanOrEqualToThreshold",
        "LessThanThreshold",
        "LessThanOrEqualToThreshold"
      ],
      var.comparison_operator
    )

    error_message = "Invalid comparison operator."
  }
}

variable "evaluation_periods" {
  description = "Number of evaluation periods."

  type = number

  default = 2
}

variable "metric_name" {
  description = "CloudWatch metric name."

  type = string
}

variable "namespace" {
  description = "CloudWatch namespace."

  type = string

  default = "AWS/EC2"
}

variable "period" {
  description = "Metric collection period in seconds."

  type = number

  default = 300
}

variable "statistic" {
  description = "CloudWatch statistic."

  type = string

  default = "Average"

  validation {
    condition = contains(
      [
        "Average",
        "Sum",
        "Minimum",
        "Maximum",
        "SampleCount"
      ],
      var.statistic
    )

    error_message = "Invalid statistic."
  }
}

variable "threshold" {
  description = "Alarm threshold."

  type = number

  default = 80
}

variable "dimensions" {
  description = "Metric dimensions."

  type = map(string)

  default = {}
}

variable "treat_missing_data" {
  description = "How CloudWatch treats missing data."

  type = string

  default = "missing"

  validation {
    condition = contains(
      [
        "missing",
        "ignore",
        "breaching",
        "notBreaching"
      ],
      var.treat_missing_data
    )

    error_message = "Invalid treat_missing_data value."
  }
}

variable "actions_enabled" {
  description = "Whether alarm actions are enabled."

  type = bool

  default = true
}

variable "alarm_actions" {
  description = "SNS topics or other actions executed when alarm enters ALARM state."

  type = list(string)

  default = []
}

variable "ok_actions" {
  description = "Actions executed when alarm returns to OK."

  type = list(string)

  default = []
}

variable "insufficient_data_actions" {
  description = "Actions executed when alarm enters INSUFFICIENT_DATA."

  type = list(string)

  default = []
}

#################################################
# Dashboard
#################################################

variable "create_dashboard" {
  description = "Create CloudWatch Dashboard."

  type = bool

  default = false
}

variable "dashboard_name" {
  description = "CloudWatch dashboard name."

  type = string

  default = ""
}

variable "dashboard_body" {
  description = "Dashboard JSON."

  type = string

  default = "{}"
}

#################################################
# Common
#################################################

variable "project" {
  description = "Project name."

  type = string

  validation {
    condition     = length(trimspace(var.project)) > 0
    error_message = "Project name cannot be empty."
  }
}

variable "environment" {
  description = "Deployment environment."

  type = string

  validation {
    condition = contains(
      [
        "dev",
        "test",
        "staging",
        "prod"
      ],
      lower(var.environment)
    )

    error_message = "Environment must be one of: dev, test, staging or prod."
  }
}

variable "tags" {
  description = "Additional resource tags."

  type = map(string)

  default = {}
}
