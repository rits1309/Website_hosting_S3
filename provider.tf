terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.26.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "ap-south-1"
}
provider "github" {
  # Configuration options
  token = "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"
}