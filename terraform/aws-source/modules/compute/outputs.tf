output "instance_id" {
  description = "ID of the NextCRM EC2 instance."
  value       = aws_instance.nextcrm.id
}

output "public_ip" {
  description = "Public IP address of the NextCRM EC2 instance."
  value       = aws_instance.nextcrm.public_ip
}

output "public_dns" {
  description = "Public DNS of the NextCRM EC2 instance."
  value       = aws_instance.nextcrm.public_dns
}

output "private_ip" {
  description = "Private IP address of the NextCRM EC2 instance."
  value       = aws_instance.nextcrm.private_ip
}