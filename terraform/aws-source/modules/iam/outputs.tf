output "instance_profile_name" {
  description = "IAM instance profile name attached to the NextCRM EC2 instance."
  value       = aws_iam_instance_profile.nextcrm_ec2_profile.name
}

output "role_name" {
  description = "IAM role name used by the NextCRM EC2 instance."
  value       = aws_iam_role.nextcrm_ec2_role.name
}

output "role_arn" {
  description = "IAM role ARN used by the NextCRM EC2 instance."
  value       = aws_iam_role.nextcrm_ec2_role.arn
}