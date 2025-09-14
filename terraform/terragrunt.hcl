locals {
  repo_name = "eks-argo-terraform"
  env_tags  = { repo = local.repo_name }
}

remote_state {
  backend = "s3"
  config = {
    bucket    = get_env("TF_STATE_BUCKET", "REPLACE_ME_STATE_BUCKET")
    key       = "${path_relative_to_include()}/terraform.tfstate"
    region    = get_env("TF_STATE_REGION", "us-east-1")
    encrypt   = true
  }
}

generate "providers" {
  path      = "providers.tf"
  if_exists = "overwrite"
  contents  = <<EOP
terraform {
  required_version = ">= 1.6"
  required_providers {
    aws        = { source = "hashicorp/aws",        version = ">= 5.0" }
    helm       = { source = "hashicorp/helm",       version = ">= 2.11" }
    kubernetes = { source = "hashicorp/kubernetes", version = ">= 2.23" }
  }
}

provider "aws" {
  region = "${get_env("AWS_REGION", "us-east-1")}"
}
EOP
}
