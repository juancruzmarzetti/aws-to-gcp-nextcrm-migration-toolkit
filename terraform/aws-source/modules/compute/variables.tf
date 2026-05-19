variable "project_name" {
  description = "Project name used for resource naming."
  type        = string
}

variable "environment" {
  description = "Deployment environment name."
  type        = string
}

variable "ami_id" {
  description = "AMI ID used to launch the EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t3.micro"
}

variable "subnet_id" {
  description = "Subnet ID where the EC2 instance will be deployed."
  type        = string
}

variable "security_group_ids" {
  description = "Security groups attached to the EC2 instance."
  type        = list(string)
}

variable "key_name" {
  description = "Name of the AWS key pair used for SSH access."
  type        = string
}

variable "iam_instance_profile_name" {
  description = "IAM instance profile attached to the EC2 instance."
  type        = string
}