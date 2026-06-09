aws_region   = "ca-central-1"
project_name = "taskboard"
environment  = "prod"

repository_names = [
  "frontend",
  "backend"
]

image_tag_mutability = "IMMUTABLE"
scan_on_push         = true
force_delete         = false
max_untagged_images  = 3
max_tagged_images    = 100

common_tags = {
  Project     = "taskboard"
  Environment = "prod"
  Owner       = "Amer"
  ManagedBy   = "Terraform"
}
