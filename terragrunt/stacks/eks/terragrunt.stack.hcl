unit {
  name = "vpc"
  source = "../../units/vpc"
}

unit {
  name = "eks"
  source = "../../units/eks"
  
  # EKS depends on VPC being created first
  depends_on = ["vpc"]
}

# Stack-level inputs that can be overridden by the live configuration
inputs = {
  # VPC Configuration
  vpc_name       = "vpc"
  vpc_cidr_block = "10.0.0.0/16"
  
  # EKS Configuration
  cluster_name = "eks"
  
  # Common tags - can be overridden
  tags = {
    ManagedBy = "Terragrunt"
    Repo      = "eks-argo-terraform"
  }
}