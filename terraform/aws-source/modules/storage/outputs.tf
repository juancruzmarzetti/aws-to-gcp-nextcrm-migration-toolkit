output "bucket_name" {
  description = "Name of the S3 bucket used by NextCRM."
  value       = aws_s3_bucket.nextcrm_storage.bucket
}

output "bucket_arn" {
  description = "ARN of the S3 bucket used by NextCRM."
  value       = aws_s3_bucket.nextcrm_storage.arn
}