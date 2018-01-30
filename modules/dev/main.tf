module "instances" {
  source = "../ec2"
  aws_ami = "${var.aws_ami}"
  instance_type = "${var.instance_type}"
  instance_count = "${var.instance_count}"
}
