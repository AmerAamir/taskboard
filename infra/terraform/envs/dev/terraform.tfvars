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

github_owner      = "AmerAamir"
github_repository = "taskboard"

github_subject_claims = [
  "repo:AmerAamir/taskboard:ref:refs/heads/dev"
]

create_github_oidc_provider      = false
existing_github_oidc_provider_arn = "arn:aws:iam::631534401204:oidc-provider/token.actions.githubusercontent.com"
