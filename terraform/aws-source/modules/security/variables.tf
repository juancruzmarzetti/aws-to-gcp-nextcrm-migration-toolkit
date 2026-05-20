variable "project_name" {
  description = "Project name used for resource naming."
  type        = string
}

variable "environment" {
  description = "Deployment environment name."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where security groups will be created."
  type        = string
}

variable "ssh_cidr" {
  description = "Trusted CIDR block allowed to SSH into the EC2 instance. Use your own IP with /32."
  type        = string
}