module "ecr" {
  source = "../../modules/ecr"

  project_name         = var.project_name
  environment          = var.environment
  repository_names     = var.repository_names
  image_tag_mutability = var.image_tag_mutability
  scan_on_push         = var.scan_on_push
  force_delete         = var.force_delete
  max_untagged_images  = var.max_untagged_images
  max_tagged_images    = var.max_tagged_images
  common_tags          = var.common_tags
}

module "github_oidc_ecr_push" {
  source = "../../modules/github_oidc_ecr_push"

  project_name                   = var.project_name
  environment                    = var.environment
  aws_region                     = var.aws_region
  github_owner                   = var.github_owner
  github_repository              = var.github_repository
  github_subject_claims          = var.github_subject_claims
  create_oidc_provider           = var.create_github_oidc_provider
  existing_oidc_provider_arn     = var.existing_github_oidc_provider_arn
  ecr_repository_names           = values(module.ecr.repository_names)
  common_tags                    = var.common_tags
}
