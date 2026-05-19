output "db_instance_address" {
  description = "DNS address of the NextCRM database instance."
  value       = aws_db_instance.nextcrm_db.address
}

output "db_instance_endpoint" {
  description = "Endpoint of the NextCRM database instance."
  value = aws_db_instance.nextcrm_db.endpoint
}

output "db_instance_port" {
  description = "Port of the NextCRM database instance."
  value = aws_db_instance.nextcrm_db.port
}

output "db_instance_id" {
  description = "ID of the NextCRM database instance."
  value = aws_db_instance.nextcrm_db.id
}

output "db_name" {
  description = "Initial database name."
  value       = aws_db_instance.nextcrm_db.db_name
}