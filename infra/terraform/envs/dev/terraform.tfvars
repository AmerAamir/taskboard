aws_region   = "ca-central-1"
project_name = "taskboard"
environment  = "dev"

repository_names = [
  "frontend",
  "backend"
]

image_tag_mutability = "MUTABLE"
scan_on_push         = true
force_delete         = false
max_untagged_images  = 5
max_tagged_images    = 30

common_tags = {
  Project     = "taskboard"
  Environment = "dev"
  Owner       = "Amer"
  ManagedBy   = "Terraform"
}
