resource "aws_security_group" "nextcrm_app" {
  name        = "${var.project_name}-${var.environment}-nextcrm-app-sg"
  description = "Security group for the NextCRM EC2 application server."
  vpc_id      = var.vpc_id

  tags = {
    Name        = "${var.project_name}-${var.environment}-nextcrm-app-sg"
    Project     = var.project_name
    Environment = var.environment
    Role        = "nextcrm-source-app"
    ManagedBy   = "terraform"
  }
}

resource "aws_security_group" "nextcrm_db" {
  name        = "${var.project_name}-${var.environment}-nextcrm-db-sg"
  description = "Security group for the NextCRM PostgreSQL RDS instance."
  vpc_id      = var.vpc_id

  tags = {
    Name        = "${var.project_name}-${var.environment}-nextcrm-db-sg"
    Project     = var.project_name
    Environment = var.environment
    Role        = "nextcrm-source-db"
    ManagedBy   = "terraform"
  }
}

resource "aws_vpc_security_group_ingress_rule" "app_ssh" {
  security_group_id = aws_security_group.nextcrm_app.id

  description = "Allow SSH access from a trusted IP."
  cidr_ipv4   = var.ssh_cidr
  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "app_http" {
  security_group_id = aws_security_group.nextcrm_app.id

  description = "Allow HTTP access to the NextCRM application."
  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "app_https" {
  security_group_id = aws_security_group.nextcrm_app.id

  description = "Allow HTTPS access to the NextCRM application."
  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "app_all_outbound" {
  security_group_id = aws_security_group.nextcrm_app.id

  description = "Allow outbound traffic from the NextCRM EC2 instance."
  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}

resource "aws_vpc_security_group_ingress_rule" "db_postgres_from_app" {
  security_group_id = aws_security_group.nextcrm_db.id

  description                  = "Allow PostgreSQL traffic from the NextCRM EC2 security group only."
  referenced_security_group_id = aws_security_group.nextcrm_app.id
  from_port                    = 5432
  to_port                      = 5432
  ip_protocol                  = "tcp"
}