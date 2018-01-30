resource "aws_iam_policy" "policy" {
  name        = "test_policy"
  description = "My test policy"
  policy = "${file("iam_policy.json")}"
}

resource "aws_iam_role" "instance" {
  name               = "instance_role"
  assume_role_policy = "${aws_iam_policy.policy}"
}
