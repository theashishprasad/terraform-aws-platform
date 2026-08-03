variable "ami_id" {
  description = "AMI ID."

  type = string
}

variable "instance_type" {
  description = "EC2 instance type."

  type = string
}

variable "instance_profile" {
  description = "IAM Instance Profile."

  type = string
}

variable "security_group_ids" {
  description = "Security Group IDs."

  type = list(string)
}

variable "private_subnet_ids" {
  description = "Private subnet IDs."

  type = list(string)
}

variable "target_group_arns" {
  description = "Target Group ARNs."

  type = list(string)
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
      ["dev", "test", "staging", "prod"],
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
