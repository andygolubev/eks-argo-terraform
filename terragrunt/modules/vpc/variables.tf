variable "name" {
  type = string
  description = "The name of the VPC"
}

variable "cidr_block" {
  type = string
  description = "The CIDR block of the VPC"
}

variable "tags" {
  type = map(string)
  description = "The tags to apply to the VPC"
}   