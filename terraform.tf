terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.30"
    }

    local = {}
  }

  required_version = ">= 1.2.0"

  backend "s3" {
    bucket = "terraform-state-danit-devops-2"
    key    = "slipchuk/step-project-3"
    region = "eu-central-1"
  }
}

provider "aws" {
  region = var.aws_region
}