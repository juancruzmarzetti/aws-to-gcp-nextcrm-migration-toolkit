resource "aws_instance" "nextcrm" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_group_ids
  key_name                    = var.key_name
  iam_instance_profile        = var.iam_instance_profile_name
  associate_public_ip_address = true

  user_data = file("${path.module}/user_data.sh")

  tags = {
    Name        = "${var.project_name}-${var.environment}-nextcrm"
    Project     = var.project_name
    Environment = var.environment
    Role        = "nextcrm-source-app"
  }
}

