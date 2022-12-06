terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.40.0"
    }
  }
  backend "s3" {
    bucket = "1011-terraform-state"
    key    = "1011/exam.state"
    region = "eu-west-1"
  }
}