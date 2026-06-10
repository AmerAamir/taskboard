variable "project_name" {
  description = "Project name used in IAM resource names and tags."
  type        = string
}

variable "environment" {
  description = "Environment name such as dev, qa, staging, or prod."
  type        = string
}

variable "aws_region" {
  description = "AWS region containing the ECR repositories."
  type        = string
}

variable "github_owner" {
  description = "GitHub organization or username."
  type        = string
}

variable "github_repository" {
  description = "GitHub repository name."
  type        = string
}

variable "github_subject_claims" {
  description = "Allowed GitHub OIDC subject claims."
  type        = list(string)
}

variable "ecr_repository_names" {
  description = "Full ECR repository names this role can push to."
  type        = list(string)
}

variable "create_oidc_provider" {
  description = "Whether to create the GitHub Actions OIDC provider in this AWS account."
  type        = bool
  default     = true
}

variable "existing_oidc_provider_arn" {
  description = "Existing GitHub Actions OIDC provider ARN if create_oidc_provider is false."
  type        = string
  default     = ""
}

variable "common_tags" {
  description = "Common AWS tags."
  type        = map(string)
  default     = {}
}
