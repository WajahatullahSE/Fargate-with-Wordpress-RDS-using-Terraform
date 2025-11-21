variable "cluster_name" { type = string }
variable "vpc_id" { type = string }
variable "subnet_ids" { type = list(string) }
variable "ecs_security_group_id" { type = string }
variable "rds_endpoint" { type = string }
variable "db_name" { type = string }
variable "db_user" { type = string }
variable "db_password" { 
    type = string
    sensitive = true 
    }
variable "ecr_repo_uri" { type = string }
variable "image_tag" { type = string }
variable "desired_count" { type = number }
variable "region" { 
    type = string 
    default = "us-west-2" 
    }
