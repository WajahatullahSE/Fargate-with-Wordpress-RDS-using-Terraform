# Task Definition
resource "aws_ecs_task_definition" "wordpress" {
  family                   = "${var.cluster_name}-wordpress"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "512"
  memory                   = "1024"
  execution_role_arn       = aws_iam_role.task_execution_role.arn
  task_role_arn            = aws_iam_role.task_role.arn

  container_definitions = jsonencode([
    {
      name      = "wordpress"
      image     = "${var.ecr_repo_uri}:${var.image_tag}"
      essential = true
      portMappings = [
        { containerPort = 80, hostPort = 80, protocol = "tcp" }
      ]
      environment = [
        { name = "WORDPRESS_DB_HOST", value = "${var.rds_endpoint}:3306" },
        { name = "WORDPRESS_DB_NAME", value = var.db_name },
        { name = "WORDPRESS_DB_USER", value = var.db_user },
        { name = "WORDPRESS_DB_PASSWORD", value = var.db_password }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = aws_cloudwatch_log_group.ecs.name
          "awslogs-region"        = var.region
          "awslogs-stream-prefix" = "wordpress"
        }
      }
    }
  ])
}