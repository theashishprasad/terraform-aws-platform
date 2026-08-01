variable "ami_id" {
  description = "AMI ID for the EC2 instance."

  type = string

  validation {
    condition     = length(trimspace(var.ami_id)) > 0
    error_message = "AMI ID cannot be empty."
  }
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
  description = "List of Security Group IDs."

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

variable "user_data" {
  description = "User data script."

  type = string

  default = ""
}

variable "associate_public_ip" {
  description = "Associate a public IP."

  type = bool

  default = true
}

variable "root_volume_size" {
  description = "Root EBS volume size (GB)."

  type = number

  default = 20

  validation {
    condition     = var.root_volume_size >= 8
    error_message = "Root volume must be at least 8 GB."
  }
}

variable "create_additional_volume" {
  description = "Create an additional EBS volume."

  type = bool

  default = false
}

variable "additional_volume_size" {
  description = "Additional EBS volume size (GB)."

  type = number

  default = 20
}

variable "create_elastic_ip" {
  description = "Allocate and associate an Elastic IP."

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
