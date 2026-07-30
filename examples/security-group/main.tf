module "web_security_group" {
  source = "../../modules/security-group"

  name        = "web-sg"
  description = "Security Group for the Web Tier"

  vpc_id = var.vpc_id

  project     = var.project
  environment = var.environment
  tags        = var.tags

  ingress_rules = [
    {
      description = "HTTPS"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
    },
    {
      description = "HTTP"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
    }
  ]

  egress_rules = [
    {
      description = "All outbound traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_ipv4   = "0.0.0.0/0"
    }
  ]
}

module "application_security_group" {
  source = "../../modules/security-group"

  name        = "application-sg"
  description = "Security Group for the Application Tier"

  vpc_id = var.vpc_id

  project     = var.project
  environment = var.environment
  tags        = var.tags

  ingress_rules = [
    {
      description       = "HTTPS from Web Tier"
      from_port         = 443
      to_port           = 443
      protocol          = "tcp"
      security_group_id = module.web_security_group.security_group_id
    }
  ]

  egress_rules = [
    {
      description = "All outbound traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_ipv4   = "0.0.0.0/0"
    }
  ]
}

module "database_security_group" {
  source = "../../modules/security-group"

  name        = "database-sg"
  description = "Security Group for the Database Tier"

  vpc_id = var.vpc_id

  project     = var.project
  environment = var.environment
  tags        = var.tags

  ingress_rules = [
    {
      description       = "PostgreSQL from Application Tier"
      from_port         = 5432
      to_port           = 5432
      protocol          = "tcp"
      security_group_id = module.application_security_group.security_group_id
    }
  ]

  egress_rules = [
    {
      description = "All outbound traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_ipv4   = "0.0.0.0/0"
    }
  ]
}
