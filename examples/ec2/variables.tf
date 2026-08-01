variable "ami_id" {
  description = "Ubuntu AMI ID."

  type = string
}

variable "instance_type" {
  description = "EC2 instance type."

  type = string

  default = "t3.micro"
}

variable "subnet_id" {
  description = "Subnet ID."

  type = string
}

variable "security_group_ids" {
  description = "Security Group IDs."

  type = list(string)
}

variable "instance_profile" {
  description = "IAM Instance Profile."

  type = string

  default = null
}

variable "key_pair" {
  description = "EC2 Key Pair."

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
