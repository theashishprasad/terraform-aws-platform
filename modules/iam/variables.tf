variable "role_name" {
  description = "Name of the IAM role."

  type = string

  validation {
    condition     = length(trimspace(var.role_name)) > 0
    error_message = "IAM role name cannot be empty."
  }
}

variable "trust_policy" {
  description = "IAM trust policy in JSON format."

  type = string

  validation {
    condition     = can(jsondecode(var.trust_policy))
    error_message = "trust_policy must be valid JSON."
  }
}

variable "managed_policy_arns" {
  description = "List of AWS managed policy ARNs."

  type = list(string)

  default = []
}

variable "custom_policy_document" {
  description = "Optional custom IAM policy document in JSON."

  type = string

  default = null

  validation {
    condition = (
      var.custom_policy_document == null ||
      can(jsondecode(var.custom_policy_document))
    )

    error_message = "custom_policy_document must be valid JSON."
  }
}

variable "create_instance_profile" {
  description = "Create an EC2 instance profile."

  type = bool

  default = false
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
  description = "Additional tags."

  type = map(string)

  default = {}
}
