output "instance_id" {
  description = "ID of the EC2 instance."

  value = aws_instance.main.id
}

output "instance_arn" {
  description = "ARN of the EC2 instance."

  value = aws_instance.main.arn
}

output "private_ip" {
  description = "Private IPv4 address of the EC2 instance."

  value = aws_instance.main.private_ip
}

output "public_ip" {
  description = "Public IPv4 address of the EC2 instance."

  value = aws_instance.main.public_ip
}

output "availability_zone" {
  description = "Availability Zone of the EC2 instance."

  value = aws_instance.main.availability_zone
}

output "private_dns" {
  description = "Private DNS hostname."

  value = aws_instance.main.private_dns
}

output "public_dns" {
  description = "Public DNS hostname."

  value = aws_instance.main.public_dns
}

output "root_volume_id" {
  description = "Root EBS volume ID."

  value = aws_instance.main.root_block_device[0].volume_id
}

output "additional_volume_id" {
  description = "Additional EBS volume ID."

  value = try(
    aws_ebs_volume.additional[0].id,
    null
  )
}

output "elastic_ip" {
  description = "Elastic IP address."

  value = try(
    aws_eip.main[0].public_ip,
    null
  )
}

output "elastic_ip_allocation_id" {
  description = "Elastic IP allocation ID."

  value = try(
    aws_eip.main[0].id,
    null
  )
}
