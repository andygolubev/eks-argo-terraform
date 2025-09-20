unit {
  name = "vpc"
  source = "../../modules/vpc"
}

inputs = {
  name       = var.vpc_name
  cidr_block = var.vpc_cidr_block
  tags       = var.tags
}
