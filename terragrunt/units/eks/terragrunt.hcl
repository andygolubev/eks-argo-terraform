unit {
  name = "eks"
  source = "../../modules/eks"
}

dependency "vpc" {
  config_path = "../vpc"
  
  # Allow planning before VPC is applied by providing mock outputs
  mock_outputs = {
    vpc_id             = "vpc-00000000000000000"
    private_subnet_ids = [
      "subnet-00000000000000001",
      "subnet-00000000000000002", 
      "subnet-00000000000000003",
    ]
  }
  mock_outputs_allowed_terraform_commands = ["init", "plan"]
}

inputs = {
  cluster_name       = var.cluster_name
  vpc_id             = dependency.vpc.outputs.vpc_id
  private_subnet_ids = dependency.vpc.outputs.private_subnet_ids
  tags               = var.tags
}
