variable "vpc_cidr_block" {
  description = "CIDR block for the VPC."
  type        = string

  validation {
    condition     = can(cidrhost(var.vpc_cidr_block, 0))
    error_message = "The VPC CIDR block must be a valid IPv4 CIDR."
  }
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet."
  type        = string

  validation {
    condition     = can(cidrhost(var.public_subnet_cidr, 0))
    error_message = "The public subnet CIDR block must be a valid IPv4 CIDR."
  }
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet."
  type        = string

  validation {
    condition     = can(cidrhost(var.private_subnet_cidr, 0))
    error_message = "The private subnet CIDR block must be a valid IPv4 CIDR."
  }
}

variable "az" {
  description = "List of Availability Zones. The first AZ is used for the private subnet and the second for the public subnet."
  type        = list(string)

  validation {
    condition     = length(var.az) >= 2
    error_message = "At least two Availability Zones must be provided."
  }
}

variable "project" {
  description = "Project name used for naming AWS resources."
  type        = string

  validation {
    condition     = length(trimspace(var.project)) > 0
    error_message = "Project name cannot be empty."
  }
}

variable "environment" {
  description = "Deployment environment (e.g. dev, test, staging, prod)."
  type        = string

  validation {
    condition = contains(
      ["dev", "test", "staging", "prod"],
      lower(var.environment)
    )
    error_message = "Environment must be one of: dev, test, staging or prod."
  }
}

variable "tags" {
  description = "Additional tags to apply to all AWS resources."
  type        = map(string)
  default     = {}
}
