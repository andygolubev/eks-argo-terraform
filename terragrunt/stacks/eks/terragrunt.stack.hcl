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