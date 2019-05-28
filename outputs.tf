output "address" {
  value = "${aws_spot_instance_request.minecraft.private_ip}"
}
