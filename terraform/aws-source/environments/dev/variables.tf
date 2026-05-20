variable "project_name" {
  description = "Project name used for resource naming."
  type        = string

  validation {
    condition     = length(var.project_name) > 0
    error_message = "project_name cannot be empty."
  }
}

variable "environment" {
  description = "Deployment environment name."
  type        = string

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be one of: dev, staging, prod."
  }
}

variable "aws_region" {
  description = "AWS region used for the source environment."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the AWS VPC."
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets."
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets."
  type        = list(string)
}

variable "ssh_cidr" {
  description = "Trusted CIDR block allowed to SSH into the EC2 instance. Use your public IP with /32."
  type        = string

  validation {
    condition     = can(cidrhost(var.ssh_cidr, 0))
    error_message = "ssh_cidr must be a valid CIDR block. Example: 181.45.10.20/32."
  }
}

variable "instance_type" {
  description = "EC2 instance type used to run the NextCRM application."
  type        = string
}

variable "key_name" {
  description = "Existing AWS key pair name used for SSH access to the EC2 instance."
  type        = string
}

variable "db_instance_type" {
  description = "RDS instance type used for the NextCRM PostgreSQL database."
  type        = string
}

variable "db_engine_version" {
  description = "PostgreSQL engine version for RDS."
  type        = string
}

variable "db_name" {
  description = "Initial database name for NextCRM."
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z][a-zA-Z0-9_]*$", var.db_name))
    error_message = "db_name must start with a letter and contain only letters, numbers and underscores. Avoid hyphens."
  }
}

variable "db_username" {
  description = "Master username for the PostgreSQL database."
  type        = string
}

variable "db_password" {
  description = "Master password for the PostgreSQL database. Do not commit real values."
  type        = string
  sensitive   = true
}