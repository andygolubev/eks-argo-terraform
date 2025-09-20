unit {
  name = "vpc"
  source = "../../modules/vpc"
}

inputs = {
  name = "vpc"
  tags = include.common.locals.common_tags
}
