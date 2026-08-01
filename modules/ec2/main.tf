locals {
  common_tags = merge(
    {
      Project     = var.project
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_instance" "main" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_group_ids
  iam_instance_profile        = var.instance_profile
  key_name                    = var.key_pair
  user_data                   = var.user_data
  associate_public_ip_address = var.associate_public_ip

  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = "gp3"
    delete_on_termination = true
    encrypted             = true
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project}-${var.environment}-ec2"
    }
  )
}

resource "aws_ebs_volume" "additional" {
  count = var.create_additional_volume ? 1 : 0

  availability_zone = aws_instance.main.availability_zone
  size              = var.additional_volume_size
  type              = "gp3"
  encrypted         = true

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project}-${var.environment}-ebs"
    }
  )
}

resource "aws_volume_attachment" "additional" {
  count = var.create_additional_volume ? 1 : 0

  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.additional[0].id
  instance_id = aws_instance.main.id

  depends_on = [
    aws_instance.main
  ]
}

resource "aws_eip" "main" {
  count = var.create_elastic_ip ? 1 : 0

  domain = "vpc"

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project}-${var.environment}-eip"
    }
  )
}

resource "aws_eip_association" "main" {
  count = var.create_elastic_ip ? 1 : 0

  instance_id   = aws_instance.main.id
  allocation_id = aws_eip.main[0].id
}
