terraform {
  required_version = ">= 1.13"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.13"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">= 3.0"
    }
  }
}
