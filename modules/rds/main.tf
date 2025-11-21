resource "aws_db_subnet_group" "this" {
  name       = "wp-db-subnet-group"
  subnet_ids = var.subnet_ids
  tags = { Name = "wp-db-subnet-group" }
}

resource "aws_db_instance" "this" {
  identifier           = "wp-mysql"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = var.instance_class
  username             = var.db_username
  password             = var.db_password
  db_name              = var.db_name
  allocated_storage    = 20
  publicly_accessible  = true
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.this.name
  vpc_security_group_ids = [var.security_group_id]

  # minor performance options
  parameter_group_name = "default.mysql8.0"
  tags = { Name = "wp-rds" }
}
