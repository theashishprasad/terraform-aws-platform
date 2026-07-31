###############################################
# EC2 IAM Role
###############################################

module "ec2_iam_role" {
  source = "../../modules/iam"

  role_name = "ec2-iam-role"

  trust_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  ]

  create_instance_profile = true

  project     = var.project
  environment = var.environment
  tags        = var.tags
}

###############################################
# S3 Read Role
###############################################

module "s3_read_role" {
  source = "../../modules/iam"

  role_name = "s3-read-role"

  trust_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  ]

  create_instance_profile = false

  project     = var.project
  environment = var.environment
  tags        = var.tags
}

###############################################
# CloudWatch Agent Role
###############################################

module "cloudwatch_agent_role" {
  source = "../../modules/iam"

  role_name = "cloudwatch-agent-role"

  trust_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  ]

  create_instance_profile = true

  project     = var.project
  environment = var.environment
  tags        = var.tags
}
