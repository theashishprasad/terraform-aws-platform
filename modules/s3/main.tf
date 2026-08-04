locals {
  common_tags = merge(
    {
      Project     = var.project
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_s3_bucket" "main" {
  bucket        = var.bucket_name
  force_destroy = var.force_destroy

  tags = merge(
    local.common_tags,
    {
      Name = var.bucket_name
    }
  )
}

resource "aws_s3_bucket_versioning" "main" {
  bucket = aws_s3_bucket.main.id

  versioning_configuration {
    status = var.versioning_enabled ? "Enabled" : "Suspended"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "main" {
  count = var.encryption_enabled ? 1 : 0

  bucket = aws_s3_bucket.main.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = var.kms_key_id == "" ? "AES256" : "aws:kms"
      kms_master_key_id = var.kms_key_id == "" ? null : var.kms_key_id
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "main" {
  count = length(var.lifecycle_rules) > 0 ? 1 : 0

  bucket = aws_s3_bucket.main.id

  dynamic "rule" {
    for_each = var.lifecycle_rules

    content {
      id     = rule.value.id
      status = rule.value.enabled ? "Enabled" : "Disabled"

      filter {
        prefix = rule.value.prefix
      }

      expiration {
        days = rule.value.expiration_days
      }
    }
  }
}

resource "aws_s3_bucket_policy" "main" {
  count = var.bucket_policy == null ? 0 : 1

  bucket = aws_s3_bucket.main.id
  policy = var.bucket_policy
}

resource "aws_s3_bucket_public_access_block" "main" {
  bucket = aws_s3_bucket.main.id

  block_public_acls       = var.public_access_block
  ignore_public_acls      = var.public_access_block
  block_public_policy     = var.public_access_block
  restrict_public_buckets = var.public_access_block
}

resource "aws_s3_bucket_logging" "main" {
  count = var.logging_bucket == "" ? 0 : 1

  bucket = aws_s3_bucket.main.id

  target_bucket = var.logging_bucket
  target_prefix = var.logging_prefix
}
