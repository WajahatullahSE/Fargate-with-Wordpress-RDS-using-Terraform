variable "region" {
  type    = string
  default = "us-west-2"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "db_username" { type = string }
variable "db_password" { 
    type = string 
    sensitive = true 
    }
variable "db_name"     { type = string }

variable "rds_instance_class" { 
    type = string 
    default = "db.t3.micro" 
    }

variable "ecr_repo_name" { 
    type = string 
    default = "image" 
    }

variable "wordpress_image_tag" { 
    type = string 
    default = "latest" 
    }

variable "desired_count" { 
    type = number 
    default = 1 
    }
