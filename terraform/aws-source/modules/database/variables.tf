variable "project_name" {
  description = "Project name used for resource naming."
  type        = string
}

variable "environment" {
  description = "Deployment environment name."
  type        = string
}

variable "db_instance_type" {
  description = "Database instance type."
  type        = string
  default     = "db.t3.micro"
}

variable "private_subnet_ids" {
  description = "Ids of the private subnets where the database instance will be deployed."
  type        = string
}

variable "security_group_ids" {
  description = "Security groups attached to the database instance."
  type        = list(string)
}

variable "db_username" {
  description = "Username for the database instance."
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "Password for the database instance."
  type        = string
  sensitive = true
}

variable "db_name" {
  description = "Name of the database to create."
  type        = string
  default     = "nextcrm"
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for the database subnet group."
  type        = list(string)
}