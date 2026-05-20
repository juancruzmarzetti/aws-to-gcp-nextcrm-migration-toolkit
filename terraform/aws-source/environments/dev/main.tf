module "network" {
  source = "../../modules/network"

  project_name = var.project_name
  environment  = var.environment
  vpc_cidr      = var.vpc_cidr
}

module "security" {
  source = "../../modules/security"

  project_name = var.project_name
  environment  = var.environment
  vpc_id        = module.network.vpc_id
  ssh_cidr      = var.ssh_cidr
}

module "storage" {
  source = "../../modules/storage"

  project_name    = var.project_name
  environment     = var.environment
}

module "iam" {
  source = "../../modules/iam"

  project_name  = var.project_name
  environment   = var.environment
  s3_bucket_arn = module.storage.bucket_arn
}

module "database" {
  source = "../../modules/database"

  project_name       = var.project_name
  environment        = var.environment
  db_instance_type   = var.db_instance_type
  db_name            = var.db_name
  db_username        = var.db_username
  db_password        = var.db_password
  private_subnet_ids = module.network.private_subnet_ids
  security_group_ids = [module.security.nextcrm_db_security_group_id]
}

module "compute" {
  source = "../../modules/compute"

  project_name              = var.project_name
  environment               = var.environment
  ami_id                    = data.aws_ami.ubuntu.id
  instance_type             = var.instance_type
  subnet_id                 = module.network.public_subnet_id
  security_group_ids        = [module.security.nextcrm_app_security_group_id]
  key_name                  = var.key_name
  iam_instance_profile_name = module.iam.instance_profile_name
}