output "gitlab_oidc_provider_arn" {
  description = "ARN of the GitLab OIDC provider."
  value       = module.oidc_gitlab.gitlab_oidc_provider_arn
}

output "gitlab_oidc_provider_url" {
  description = "URL of the GitLab OIDC provider."
  value       = module.oidc_gitlab.gitlab_oidc_provider_url
}

output "gitlab_role_arns" {
  description = "IAM role ARNs assumable by GitLab pipelines."
  value       = module.oidc_gitlab.iam_role_arns
}