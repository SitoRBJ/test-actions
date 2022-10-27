terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  required_version = "~> 1.0"
  backend "s3" {
    bucket = "terraform-remote-state-vf8d"
    key    = "testing"
    region = "us-east-1"
    acl    = "bucket-owner-full-control"
  }
}


# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  assume_role {
    role_arn = var.account_iam_roles["websites"]
  }

}

provider "aws" {
  region = "us-east-1"
  alias  = "shared"
  assume_role {
    role_arn = var.account_iam_roles["shared"]
  }
}

