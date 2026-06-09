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
