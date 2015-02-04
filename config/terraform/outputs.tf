output "ops_manager_ip" {
  value = "${aws_instance.ops_manager.public_ip}"
}
