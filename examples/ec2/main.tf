###############################################
# Ubuntu Web Server Example
###############################################

module "ubuntu_web_server" {
  source = "../../modules/ec2"

  ami_id        = var.ami_id
  instance_type = var.instance_type

  subnet_id = var.subnet_id

  security_group_ids = var.security_group_ids

  instance_profile = var.instance_profile

  key_pair = var.key_pair

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y nginx
              systemctl enable nginx
              systemctl start nginx
              EOF

  associate_public_ip = true

  root_volume_size = 20

  create_additional_volume = true

  additional_volume_size = 40

  create_elastic_ip = true

  project     = var.project
  environment = var.environment
  tags        = var.tags
}
