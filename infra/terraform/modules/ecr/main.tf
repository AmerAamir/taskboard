resource "aws_ecr_repository" "this" {
  for_each = toset(var.repository_names)

  name                 = "${var.project_name}-${var.environment}-${each.value}"
  image_tag_mutability = var.image_tag_mutability
  force_delete         = var.force_delete

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = merge(
    var.common_tags,
    {
      Name        = "${var.project_name}-${var.environment}-${each.value}"
      Project     = var.project_name
      Environment = var.environment
      Service     = each.value
      ManagedBy   = "Terraform"
    }
  )
}

resource "aws_ecr_lifecycle_policy" "this" {
  for_each = aws_ecr_repository.this

  repository = each.value.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Remove untagged images after the configured limit"
        selection = {
          tagStatus   = "untagged"
          countType   = "imageCountMoreThan"
          countNumber = var.max_untagged_images
        }
        action = {
          type = "expire"
        }
      },
      {
        rulePriority = 2
        description  = "Keep only the latest configured number of tagged images"
        selection = {
          tagStatus     = "tagged"
          tagPrefixList = ["v", "dev", "qa", "staging", "prod", "latest"]
          countType     = "imageCountMoreThan"
          countNumber   = var.max_tagged_images
        }
        action = {
          type = "expire"
        }
      }
    ]
  })
}
