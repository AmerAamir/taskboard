variable "project_name" {
  description = "Project name used in resource names and tags."
  type        = string
}

variable "environment" {
  description = "Environment name such as dev, qa, staging, or prod."
  type        = string
}

variable "repository_names" {
  description = "Short ECR repository names to create."
  type        = list(string)
}

variable "image_tag_mutability" {
  description = "Whether ECR image tags can be overwritten."
  type        = string
  default     = "MUTABLE"

  validation {
    condition     = contains(["MUTABLE", "IMMUTABLE"], var.image_tag_mutability)
    error_message = "image_tag_mutability must be MUTABLE or IMMUTABLE."
  }
}

variable "scan_on_push" {
  description = "Whether ECR should scan images when they are pushed."
  type        = bool
  default     = true
}

variable "force_delete" {
  description = "Whether Terraform can delete non empty ECR repositories."
  type        = bool
  default     = false
}

variable "max_untagged_images" {
  description = "Number of untagged images to keep."
  type        = number
  default     = 5
}

variable "max_tagged_images" {
  description = "Number of tagged images to keep."
  type        = number
  default     = 30
}

variable "common_tags" {
  description = "Common AWS tags applied to all resources."
  type        = map(string)
  default     = {}
}
