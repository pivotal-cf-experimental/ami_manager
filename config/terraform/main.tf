provider "aws" {
  region = "${var.aws_region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

resource "aws_instance" "ops_manager" {
  instance_type = "m3.medium"
  ami = "${var.aws_ami_id}"
  key_name = "${var.key_name}"
  security_groups = ["${var.security_group_id}"]
  subnet_id = "${var.subnet_id }"
  associate_public_ip_address = true
}
