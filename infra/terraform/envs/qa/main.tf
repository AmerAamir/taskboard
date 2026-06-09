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
