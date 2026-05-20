output "nextcrm_app_security_group_id" {
  description = "Security Group ID for the NextCRM EC2 application server."
  value       = aws_security_group.nextcrm_app.id
}

output "nextcrm_db_security_group_id" {
  description = "Security Group ID for the NextCRM PostgreSQL RDS instance."
  value       = aws_security_group.nextcrm_db.id
}