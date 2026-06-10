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

output "github_actions_role_arn" {
  description = "IAM role ARN for GitHub Actions OIDC authentication."
  value       = module.github_oidc_ecr_push.github_actions_role_arn
}

output "github_actions_role_name" {
  description = "IAM role name for GitHub Actions OIDC authentication."
  value       = module.github_oidc_ecr_push.github_actions_role_name
}

output "github_oidc_provider_arn" {
  description = "GitHub Actions OIDC provider ARN."
  value       = module.github_oidc_ecr_push.github_oidc_provider_arn
}
