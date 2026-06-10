output "ecr_repository_urls" {
  description = "ECR repository URLs for this environment."
  value       = module.ecr.repository_urls
}

output "ecr_repository_arns" {
  description = "ECR repository ARNs for this environment."
  value       = module.ecr.repository_arns
}

output "ecr_repository_names" {
  description = "ECR repository names for this environment."
  value       = module.ecr.repository_names
}
