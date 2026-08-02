#################################################
# Application Load Balancer Example
#################################################

module "web_application_alb" {
  source = "../../modules/alb"

  alb_name = "web-alb"

  vpc_id = var.vpc_id

  public_subnet_ids = var.public_subnet_ids

  security_group_ids = var.security_group_ids

  target_ids = var.target_ids

  target_group_port     = 80
  target_group_protocol = "HTTP"
  target_type           = "instance"

  health_check_path     = "/health"
  health_check_protocol = "HTTP"
  health_check_matcher  = "200"

  enable_https = true

  certificate_arn = var.certificate_arn

  http_redirect = true

  enable_deletion_protection = false

  internal = false

  idle_timeout = 60

  project     = var.project
  environment = var.environment
  tags        = var.tags
}
