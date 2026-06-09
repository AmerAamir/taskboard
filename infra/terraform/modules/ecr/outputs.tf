output "repository_urls" {
  description = "ECR repository URLs, useful for Docker push commands and CI."
  value = {
    for name, repo in aws_ecr_repository.this : name => repo.repository_url
  }
}

output "repository_arns" {
  description = "ECR repository ARNs, useful for IAM policies later."
  value = {
    for name, repo in aws_ecr_repository.this : name => repo.arn
  }
}

output "repository_names" {
  description = "Created ECR repository names."
  value = {
    for name, repo in aws_ecr_repository.this : name => repo.name
  }
}
