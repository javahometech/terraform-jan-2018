# Provision 2 ec2 instances

resource "aws_instance" "my-instance" {
  ami                         = "${lookup(var.region_ami, var.aws_region)}"
  instance_type               = "t2.micro"
  count                       = 3
  vpc_security_group_ids      = ["${aws_security_group.webservers_sg.id}"]
  subnet_id                   = "${element(aws_subnet.subnets.*.id,count.index)}"
  user_data                   = "${file("webserver.sh")}"
  associate_public_ip_address = true

  tags {
    Name       = "ByTerraform"
    Department = "Training"
  }
}
