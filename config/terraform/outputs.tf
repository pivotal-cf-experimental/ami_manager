output "web_instance_address" {
  value = "${aws_instance.ops_manager_web.public_dns}"
}
