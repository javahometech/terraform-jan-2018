# Configure provider as AWS

provider "aws" {
  region = "${var.aws_region}"
}

terraform {
  backend "s3" {
    bucket = "javahome-1"
    key    = "javahomeapp/terraform.tfstate"
    region = "us-east-1"
  }
}
