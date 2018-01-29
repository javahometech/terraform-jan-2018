variable "aws_region" {
  default = "ap-south-1"
}

# CIDR block for VPC
variable "vpc_cidr" {
  default = "10.20.0.0/16"
}

# CIDR block for Subnet
variable "subnets_cidr" {
  type    = "list"
  default = ["10.20.1.0/24", "10.20.2.0/24"]
}

# Region and AMI mapping variable
variable "region_ami" {
  type = "map"

  default = {
    ap-south-1 = "ami-531a4c3c"
    us-west-2  = "ami-f2d3638a"
  }
}
