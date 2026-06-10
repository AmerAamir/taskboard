output "github_actions_role_arn" {
  description = "IAM role ARN for GitHub Actions OIDC authentication."
  value       = aws_iam_role.github_actions_ecr_push.arn
}

output "github_actions_role_name" {
  description = "IAM role name for GitHub Actions OIDC authentication."
  value       = aws_iam_role.github_actions_ecr_push.name
}

output "github_oidc_provider_arn" {
  description = "GitHub Actions OIDC provider ARN."
  value       = local.oidc_provider_arn
}
