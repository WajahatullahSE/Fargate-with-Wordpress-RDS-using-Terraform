resource "aws_ecr_repository" "this" {
  name = var.repo_name
  image_scanning_configuration { scan_on_push = false }
  tags = { Name = var.repo_name }
}
