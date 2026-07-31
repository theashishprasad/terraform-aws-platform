output "role_arn" {
  description = "ARN of the IAM role."

  value = aws_iam_role.main.arn
}

output "role_name" {
  description = "Name of the IAM role."

  value = aws_iam_role.main.name
}

output "policy_arn" {
  description = "ARN of the custom IAM policy."

  value = try(
    aws_iam_policy.main[0].arn,
    null
  )
}

output "policy_name" {
  description = "Name of the custom IAM policy."

  value = try(
    aws_iam_policy.main[0].name,
    null
  )
}

output "instance_profile_name" {
  description = "Name of the IAM instance profile."

  value = try(
    aws_iam_instance_profile.main[0].name,
    null
  )
}

output "instance_profile_arn" {
  description = "ARN of the IAM instance profile."

  value = try(
    aws_iam_instance_profile.main[0].arn,
    null
  )
}
