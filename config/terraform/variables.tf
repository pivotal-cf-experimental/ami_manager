variable "key_name" {
  description = "Name of the SSH keypair to use in AWS."
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

variable "aws_ami_id" {
  description = "Ops Manager AMI."
}

variable "security_group_id" {
  description = "Security Group ID"
}

variable "subnet_id" {
  description = "VPC's Subnet ID"
}
