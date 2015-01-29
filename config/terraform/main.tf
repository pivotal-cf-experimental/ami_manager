provider "aws" {
    region = "${var.aws_region}"
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
}

resource "aws_security_group" "ops_manager_security_group" {
    name = "ops_manager_security_group"
    description = "Used by the Ops Manager clean_install_spec"

    ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["${var.aws_security_group_cidr_block}"]
    }

    ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["${var.aws_security_group_cidr_block}"]
    }

    ingress {
      from_port = 443
      to_port = 443
      protocol = "tcp"
      cidr_blocks = ["${var.aws_security_group_cidr_block}"]
    }
}

resource "aws_instance" "ops_manager_web" {
  connection {
    user = "ubuntu"
    key_file = "${var.key_path}"
  }

  instance_type = "m3.medium"
  ami = "${var.aws_ami_id}"
  key_name = "${var.key_name}"
  security_groups = ["${aws_security_group.ops_manager_security_group.name}"]
  associate_public_ip_address = true
}
