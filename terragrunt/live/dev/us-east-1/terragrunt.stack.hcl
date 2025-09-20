stack "eks" {
  path   = "."
  source = "file:///Users/andy/repo/andygolubev/eks-argo-terraform/terragrunt/stacks/eks"

  values = {
    # VPC
    vpc_name       = "eks-dev-vpc"
    vpc_cidr_block = "10.0.0.0/16"

    # EKS
    cluster_name = "eks-dev-cluster"

    # Inline tags (no include here)
    tags = {
      ManagedBy   = "Terragrunt"
      Repo        = "eks-argo-terraform"
      Environment = "dev"
      Region      = "us-east-1"
      Project     = "eks-argo-terraform"
    }
  }
}