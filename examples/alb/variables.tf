variable "vpc_id" {
  description = "VPC ID."

  type = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs."

  type = list(string)
}

variable "security_group_ids" {
  description = "Security Group IDs."

  type = list(string)
}

variable "target_ids" {
  description = "EC2 Instance IDs."

  type = list(string)
}

variable "certificate_arn" {
  description = "ACM Certificate ARN."

  type = string

  default = null
}

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
