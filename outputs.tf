output "elb_dns" {
  value = "${aws_elb.javahome_elb.dns_name}"
}

output "public_ips" {
  value = ["${aws_instance.my-instance.*.public_ip}"]
}
