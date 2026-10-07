terraform {
  backend "s3" {
    bucket         = "prod-e-cart-terraform-state"
    key            = "Terraform/dev/terraform.tfstate"
    region         = "ap-southeast-2"
    use_lockfile     = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.0.0"
}
provider "aws" {
  region = "ap-southeast-2"
}