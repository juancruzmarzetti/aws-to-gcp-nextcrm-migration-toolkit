variable "project_name" {
  description = "Project name used for resource naming."
  type        = string
}

variable "environment" {
  description = "Deployment environment name."
  type        = string
}

variable "s3_bucket_arn" {
  description = "ARN of the S3 bucket used by NextCRM."
  type        = string
}