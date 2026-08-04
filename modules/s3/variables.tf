variable "bucket_name" {
  description = "Name of the S3 bucket."
  type        = string

  validation {
    condition     = length(trimspace(var.bucket_name)) > 2
    error_message = "Bucket name must contain at least 3 characters."
  }
}

variable "versioning_enabled" {
  description = "Enable bucket versioning."
  type        = bool

  default = true
}

variable "encryption_enabled" {
  description = "Enable server-side encryption."
  type        = bool

  default = true
}

variable "kms_key_id" {
  description = "Optional KMS Key ARN. Leave empty to use AES256."
  type        = string

  default = ""
}

variable "lifecycle_rules" {
  description = "Lifecycle rules."

  type = list(object({
    id              = string
    enabled         = bool
    prefix          = string
    expiration_days = number
  }))

  default = []
}

variable "bucket_policy" {
  description = "Optional bucket policy JSON."

  type = string

  default = null
}

variable "public_access_block" {
  description = "Enable S3 Public Access Block."

  type = bool

  default = true
}

variable "logging_bucket" {
  description = "Target bucket for access logs."

  type = string

  default = ""
}

variable "logging_prefix" {
  description = "Prefix for server access logs."

  type = string

  default = "logs/"
}

variable "force_destroy" {
  description = "Delete bucket even when not empty."

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
