variable "vpc_id" { type = string }
variable "subnet_ids" { type = list(string) }
variable "db_username" { type = string }
variable "db_password" { 
    type = string 
    sensitive = true 
    }
variable "db_name" { type = string }
variable "instance_class" { type = string }
variable "security_group_id" { type = string }
