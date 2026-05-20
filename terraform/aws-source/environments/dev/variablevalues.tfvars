project_name = "nextcrm-migration"
environment  = "dev"
aws_region   = "us-east-1"

vpc_cidr = "10.10.0.0/16"

public_subnet_cidrs = [
  "10.10.1.0/24",
  "10.10.2.0/24"
]

private_subnet_cidrs = [
  "10.10.11.0/24",
  "10.10.12.0/24"
]

ssh_cidr = "YOUR_PUBLIC_IP/32"

instance_type = "t3.micro"
key_name      = "your-existing-key-pair-name"

db_instance_type  = "db.t3.micro"
db_engine_version = "16"
db_name           = "nextcrm"
db_username       = "postgres"
db_password       = "your-secure-password"