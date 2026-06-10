aws_region   = "ca-central-1"
project_name = "taskboard"
environment  = "staging"

repository_names = [
  "frontend",
  "backend"
]

image_tag_mutability = "IMMUTABLE"
scan_on_push         = true
force_delete         = false
max_untagged_images  = 5
max_tagged_images    = 50

common_tags = {
  Project     = "taskboard"
  Environment = "staging"
  Owner       = "Amer"
  ManagedBy   = "Terraform"
}
