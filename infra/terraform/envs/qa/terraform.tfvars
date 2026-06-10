aws_region   = "ca-central-1"
project_name = "taskboard"
environment  = "qa"

repository_names = [
  "frontend",
  "backend"
]

image_tag_mutability = "MUTABLE"
scan_on_push         = true
force_delete         = false
max_untagged_images  = 5
max_tagged_images    = 40

common_tags = {
  Project     = "taskboard"
  Environment = "qa"
  Owner       = "Amer"
  ManagedBy   = "Terraform"
}
