variable "ami_id" {
  description = "AMI ID used by the Launch Template."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
}

variable "instance_profile" {
  description = "IAM Instance Profile name."
  type        = string
}

variable "security_group_ids" {
  description = "Security Group IDs."

  type = list(string)
}

variable "user_data" {
  description = "User data script."

  type = string

  default = ""
}

variable "root_volume_size" {
  description = "Root EBS volume size in GB."

  type = number

  default = 20
}

variable "desired_capacity" {
  description = "Desired number of instances."

  type = number

  default = 2
}

variable "minimum_size" {
  description = "Minimum ASG size."

  type = number

  default = 2
}

variable "maximum_size" {
  description = "Maximum ASG size."

  type = number

  default = 4
}

variable "private_subnet_ids" {
  description = "Private subnet IDs."

  type = list(string)
}

variable "health_check_type" {
  description = "Health check type."

  type = string

  default = "EC2"

  validation {
    condition = contains(
      [
        "EC2",
        "ELB"
      ],
      upper(var.health_check_type)
    )

    error_message = "Health check type must be EC2 or ELB."
  }
}

variable "health_check_grace_period" {
  description = "Health check grace period."

  type = number

  default = 300
}

variable "target_group_arns" {
  description = "Target Group ARNs."

  type = list(string)

  default = []
}

variable "termination_policies" {
  description = "Termination policies."

  type = list(string)

  default = [
    "OldestInstance"
  ]
}

variable "cpu_utilization_target" {
  description = "Average CPU utilization target."

  type = number

  default = 70
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
