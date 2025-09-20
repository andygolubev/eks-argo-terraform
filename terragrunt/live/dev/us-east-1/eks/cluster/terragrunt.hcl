stack {
  source = "../../../../../stacks/eks"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

include "common" {
  path = find_in_parent_folders("_common.hcl")
  expose = true
}

# Environment-specific inputs that override stack defaults
inputs = {
  # VPC Configuration for dev environment
  vpc_name       = "eks-dev-vpc"
  vpc_cidr_block = "10.0.0.0/16"
  
  # EKS Configuration for dev environment
  cluster_name = "eks-dev-cluster"
  
  # Environment-specific tags
  tags = merge(include.common.locals.common_tags, {
    Environment = "dev"
    Region      = "us-east-1"
    Project     = "eks-argo-terraform"
  })
}


