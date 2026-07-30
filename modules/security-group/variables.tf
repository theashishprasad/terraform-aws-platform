variable "name" {
  description = "Name of the Security Group."
  type        = string

  validation {
    condition     = length(trimspace(var.name)) > 0
    error_message = "Security Group name cannot be empty."
  }
}

variable "description" {
  description = "Description of the Security Group."
  type        = string
  default     = "Managed by Terraform"
}

variable "vpc_id" {
  description = "VPC ID where the Security Group will be created."
  type        = string
}

variable "project" {
  description = "Project name."
  type        = string

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

variable "ingress_rules" {
  description = "Ingress rules."

  type = list(object({
    description       = optional(string)
    from_port         = number
    to_port           = number
    protocol          = string
    cidr_ipv4         = optional(string)
    cidr_ipv6         = optional(string)
    prefix_list_id    = optional(string)
    security_group_id = optional(string)
  }))

  default = []
}

variable "egress_rules" {
  description = "Egress rules."

  type = list(object({
    description       = optional(string)
    from_port         = number
    to_port           = number
    protocol          = string
    cidr_ipv4         = optional(string)
    cidr_ipv6         = optional(string)
    prefix_list_id    = optional(string)
    security_group_id = optional(string)
  }))

  default = []
}
