variable "alb_name" {
  description = "Name of the Application Load Balancer."
  type        = string

  validation {
    condition     = length(trimspace(var.alb_name)) > 0
    error_message = "ALB name cannot be empty."
  }
}

variable "vpc_id" {
  description = "VPC ID where the ALB is deployed."
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs for the ALB."
  type        = list(string)

  validation {
    condition     = length(var.public_subnet_ids) >= 2
    error_message = "At least two public subnet IDs are required."
  }
}

variable "security_group_ids" {
  description = "Security group IDs attached to the ALB."
  type        = list(string)
}

variable "internal" {
  description = "Whether the ALB is internal."
  type        = bool
  default     = false
}

variable "enable_deletion_protection" {
  description = "Enable deletion protection."
  type        = bool
  default     = false
}

variable "idle_timeout" {
  description = "Idle timeout in seconds."
  type        = number
  default     = 60
}

variable "target_group_port" {
  description = "Target group listener port."
  type        = number
  default     = 80
}

variable "target_group_protocol" {
  description = "Target group protocol."
  type        = string
  default     = "HTTP"

  validation {
    condition = contains(
      ["HTTP", "HTTPS"],
      upper(var.target_group_protocol)
    )
    error_message = "Target group protocol must be HTTP or HTTPS."
  }
}

variable "target_type" {
  description = "Target type."
  type        = string
  default     = "instance"

  validation {
    condition = contains(
      ["instance", "ip", "lambda"],
      lower(var.target_type)
    )
    error_message = "Target type must be instance, ip or lambda."
  }
}

variable "target_ids" {
  description = "Target resource IDs."
  type        = list(string)
  default     = []
}

variable "health_check_path" {
  description = "Health check path."
  type        = string
  default     = "/"
}

variable "health_check_protocol" {
  description = "Health check protocol."
  type        = string
  default     = "HTTP"

  validation {
    condition = contains(
      ["HTTP", "HTTPS"],
      upper(var.health_check_protocol)
    )
    error_message = "Health check protocol must be HTTP or HTTPS."
  }
}

variable "health_check_matcher" {
  description = "Expected HTTP response codes."
  type        = string
  default     = "200"
}

variable "enable_https" {
  description = "Enable HTTPS listener."
  type        = bool
  default     = false
}

variable "certificate_arn" {
  description = "ACM certificate ARN."
  type        = string
  default     = null
}

variable "http_redirect" {
  description = "Redirect HTTP requests to HTTPS."
  type        = bool
  default     = false
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
  description = "Additional resource tags."
  type        = map(string)
  default     = {}
}
