locals {
  repo_name = "eks-argo-terraform"
  env_tags  = { repo = local.repo_name }
}

remote_state {
  backend = "s3"
  config = {
    bucket       = "eks-argo-terraform-tf-state-bucket"
    key          = "${path_relative_to_include()}/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}

generate "providers" {
  path      = "providers.tf"
  if_exists = "overwrite"
  contents  = <<EOP
terraform {
  required_version = ">= 1.13"
  required_providers {
    aws        = { source = "hashicorp/aws",        version = ">= 6.13" }
    helm       = { source = "hashicorp/helm",       version = ">= 3.0" }
    kubernetes = { source = "hashicorp/kubernetes", version = ">= 2.38" }
  }
}

provider "aws" {
  region = us-east-1"
}
EOP
}

# Ensure a backend block exists so Terragrunt remote_state settings take effect
generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite"
  contents  = <<EOB
terraform {
  backend "s3" {}
}
EOB
}


