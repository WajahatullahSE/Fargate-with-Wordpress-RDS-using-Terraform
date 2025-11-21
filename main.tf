module "vpc" {
  source     = "./modules/vpc"
  vpc_cidr   = var.vpc_cidr
  public_subnets = var.public_subnets
  region = var.region
}

module "security" {
  source = "./modules/security"
  vpc_id = module.vpc.vpc_id
}

module "ecr" {
  source      = "./modules/ecr"
  repo_name   = var.ecr_repo_name
}

module "rds" {
  source            = "./modules/rds"
  vpc_id            = module.vpc.vpc_id
  subnet_ids        = module.vpc.public_subnet_ids
  db_username       = var.db_username
  db_password       = var.db_password
  db_name           = var.db_name
  instance_class    = var.rds_instance_class
  security_group_id = module.security.rds_sg_id
}

module "ecs" {
  source           = "./modules/ecs"
  cluster_name     = "wordpress-cluster"
  vpc_id           = module.vpc.vpc_id
  subnet_ids       = module.vpc.public_subnet_ids
  ecs_security_group_id = module.security.ecs_sg_id
  rds_endpoint     = module.rds.rds_endpoint
  db_name          = var.db_name
  db_user          = var.db_username
  db_password      = var.db_password
  ecr_repo_uri     = module.ecr.repository_url
  image_tag        = var.wordpress_image_tag
  desired_count    = var.desired_count
}
