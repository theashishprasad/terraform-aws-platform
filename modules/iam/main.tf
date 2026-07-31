locals {
  common_tags = merge(
    {
      Project     = var.project
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_iam_role" "main" {
  name               = var.role_name
  assume_role_policy = var.trust_policy

  tags = merge(
    local.common_tags,
    {
      Name = var.role_name
    }
  )
}

resource "aws_iam_policy" "main" {
  count = var.custom_policy_document != null ? 1 : 0

  name        = "${var.role_name}-policy"
  path        = "/"
  description = "Custom IAM policy for ${var.role_name}"

  policy = var.custom_policy_document

  tags = merge(
    local.common_tags,
    {
      Name = "${var.role_name}-policy"
    }
  )
}

resource "aws_iam_role_policy_attachment" "managed" {
  for_each = toset(var.managed_policy_arns)

  role       = aws_iam_role.main.name
  policy_arn = each.value
}

resource "aws_iam_role_policy_attachment" "custom" {
  count = var.custom_policy_document != null ? 1 : 0

  role       = aws_iam_role.main.name
  policy_arn = aws_iam_policy.main[0].arn
}

resource "aws_iam_instance_profile" "main" {
  count = var.create_instance_profile ? 1 : 0

  name = "${var.role_name}-instance-profile"
  role = aws_iam_role.main.name

  tags = merge(
    local.common_tags,
    {
      Name = "${var.role_name}-instance-profile"
    }
  )
}
