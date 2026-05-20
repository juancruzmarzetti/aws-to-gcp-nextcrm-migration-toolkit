resource "aws_db_instance" "nextcrm_db" {
  identifier                 = "my-postgres-db"
  allocated_storage          = 20
  max_allocated_storage      = 50 # allow auto-scaling up to 50 GB
  engine                     = "postgres"
  engine_version             = "16"
  instance_class             = var.db_instance_type
  db_name                    = var.db_name
  username                   = var.db_username
  password                   = var.db_password
  parameter_group_name       = "default.postgres16"
  vpc_security_group_ids     = var.security_group_ids
  db_subnet_group_name       = aws_db_subnet_group.nextcrm_db_subnet_group.name
  skip_final_snapshot        = true
  publicly_accessible        = false
  port                       = 5432
  multi_az                   = false
  deletion_protection        = false
  auto_minor_version_upgrade = true
  storage_type               = "gp3"

  tags = {
    Name        = "${var.project_name}-${var.environment}-nextcrm-db"
    Project     = var.project_name
    Environment = var.environment
    Role        = "nextcrm-source-db"
    ManagedBy   = "terraform"
  }
}

resource "aws_db_subnet_group" "nextcrm_db_subnet_group" {
  name       = "${var.project_name}-${var.environment}-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name        = "${var.project_name}-${var.environment}-db-subnet-group"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}