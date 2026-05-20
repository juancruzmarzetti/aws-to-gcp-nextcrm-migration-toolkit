output "vpc_id" {
  description = "ID of the AWS VPC."
  value       = aws_vpc.this.id
}

output "vpc_cidr_block" {
  description = "CIDR block of the AWS VPC."
  value       = aws_vpc.this.cidr_block
}

output "public_subnet_ids" {
  description = "IDs of the public subnets."
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs of the private subnets."
  value       = aws_subnet.private[*].id
}

output "public_subnet_id" {
  description = "ID of the first public subnet. Used for the EC2 instance in the dev environment."
  value       = aws_subnet.public[0].id
}

output "private_subnet_id" {
  description = "ID of the first private subnet."
  value       = aws_subnet.private[0].id
}

output "availability_zones" {
  description = "Availability zones used by the network module."
  value       = data.aws_availability_zones.available.names
}