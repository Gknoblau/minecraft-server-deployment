output "minecraft_server_address" {
  value = "${aws_spot_instance_request.minecraft.public_ip}"
}