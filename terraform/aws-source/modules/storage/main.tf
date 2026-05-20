resource "aws_s3_bucket" "nextcrm_storage" {
  bucket = "${var.project_name}-${var.environment}-nextcrm-storage"

  tags = {
    Name        = "${var.project_name}-${var.environment}-nextcrm-storage"
    Project     = var.project_name
    Environment = var.environment
    Role        = "nextcrm-source-storage"
    ManagedBy   = "terraform"
  }
}

resource "aws_s3_bucket_versioning" "nextcrm_storage_versioning" {
  bucket = aws_s3_bucket.nextcrm_storage.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "nextcrm_storage_encryption" {
  bucket = aws_s3_bucket.nextcrm_storage.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

