variable "aws_region" {
  description = "AWS region where resources will be created."
  type        = string
}

variable "project_name" {
  description = "Project name."
  type        = string
}

variable "environment" {
  description = "Environment name."
  type        = string
}

variable "repository_names" {
  description = "ECR repositories to create."
  type        = list(string)
}

variable "image_tag_mutability" {
  description = "Whether ECR image tags can be overwritten."
  type        = string
}

variable "scan_on_push" {
  description = "Whether ECR scans images on push."
  type        = bool
}

variable "force_delete" {
  description = "Whether Terraform can delete non empty ECR repositories."
  type        = bool
}

variable "max_untagged_images" {
  description = "Number of untagged images to keep."
  type        = number
}

variable "max_tagged_images" {
  description = "Number of tagged images to keep."
  type        = number
}

variable "common_tags" {
  description = "Common AWS tags."
  type        = map(string)
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

variable "create_github_oidc_provider" {
  description = "Whether to create the GitHub Actions OIDC provider."
  type        = bool
}

variable "existing_github_oidc_provider_arn" {
  description = "Existing GitHub Actions OIDC provider ARN if not creating one."
  type        = string
}
