variable "key_name" {
  description = "Name of the SSH keypair to use in AWS."
}

variable "key_path" {
  description = "Path to the private portion of the SSH key specified."
}

variable "access_key" {
  description = "Access key for the IAM user."
}

variable "secret_key" {
  description = "Secret key for the IAM user."
}

variable "aws_region" {
  description = "AWS region to launch servers."
  default = "us-east-1"
}

variable "aws_amis" {
  default = {
    us-east-1 = "ami-66b5f00e"
  }
}

variable "aws_security_group_cidr_block" {
  default = "0.0.0.0/0"
}
