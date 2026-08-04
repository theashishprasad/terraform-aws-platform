module "secure_application_bucket" {
  source = "../../modules/s3"

  bucket_name = var.bucket_name

  versioning_enabled = true

  encryption_enabled = true

  # Leave empty to use AES256 encryption.
  # Specify a KMS Key ARN to use SSE-KMS.
  kms_key_id = ""

  lifecycle_rules = [
    {
      id              = "expire-logs"
      enabled         = true
      prefix          = "logs/"
      expiration_days = 30
    }
  ]

  bucket_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Sid       = "DenyInsecureTransport"
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"

        Resource = [
          "arn:aws:s3:::${var.bucket_name}",
          "arn:aws:s3:::${var.bucket_name}/*"
        ]

        Condition = {
          Bool = {
            "aws:SecureTransport" = "false"
          }
        }
      }
    ]
  })

  public_access_block = true

  logging_bucket = ""
  logging_prefix = "logs/"

  force_destroy = false

  project     = var.project
  environment = var.environment
  tags        = var.tags
}
