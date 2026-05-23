variable "aws_region" {
  description = "AWS region used to create the GitLab OIDC bootstrap resources."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name used for naming IAM resources."
  type        = string
  default     = "nextcrm-migration"
}

variable "environment" {
  description = "Environment name."
  type        = string
  default     = "dev"
}

variable "gitlab_project_path" {
  description = "GitLab project path allowed to assume the AWS role. Example: gitlabuser/gitlab-repo"
  type        = string
}

variable "gitlab_branch" {
  description = "GitLab branch allowed to assume the AWS role."
  type        = string
  default     = "main"
}