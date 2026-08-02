locals {
  common_tags = merge(
    {
      Project     = var.project
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_lb" "main" {
  name               = var.alb_name
  internal           = var.internal
  load_balancer_type = "application"

  security_groups = var.security_group_ids
  subnets         = var.public_subnet_ids

  enable_deletion_protection       = var.enable_deletion_protection
  enable_cross_zone_load_balancing = true
  enable_http2                     = true
  drop_invalid_header_fields       = true
  idle_timeout                     = var.idle_timeout

  tags = merge(
    local.common_tags,
    {
      Name = var.alb_name
    }
  )
}

resource "aws_lb_target_group" "main" {
  name             = "${var.alb_name}-tg"
  port             = var.target_group_port
  protocol         = var.target_group_protocol
  protocol_version = "HTTP1"
  target_type      = var.target_type

  vpc_id = var.vpc_id

  deregistration_delay = 30

  health_check {
    enabled             = true
    path                = var.health_check_path
    protocol            = var.health_check_protocol
    matcher             = var.health_check_matcher
    port                = "traffic-port"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 2
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.alb_name}-tg"
    }
  )
}

resource "aws_lb_target_group_attachment" "main" {
  count = length(var.target_ids)

  target_group_arn = aws_lb_target_group.main.arn
  target_id        = var.target_ids[count.index]
  port             = var.target_group_port
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"

  dynamic "default_action" {
    for_each = var.http_redirect ? [1] : []

    content {
      type = "redirect"

      redirect {
        protocol    = "HTTPS"
        port        = "443"
        status_code = "HTTP_301"
      }
    }
  }

  dynamic "default_action" {
    for_each = var.http_redirect ? [] : [1]

    content {
      type             = "forward"
      target_group_arn = aws_lb_target_group.main.arn
    }
  }
}

resource "aws_lb_listener" "https" {
  count = var.enable_https ? 1 : 0

  load_balancer_arn = aws_lb.main.arn
  port              = 443
  protocol          = "HTTPS"

  ssl_policy      = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate_arn = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}
