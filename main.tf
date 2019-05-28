# Specify the provider and access details
provider "aws" {
  version = "~> 2.12"
  region = "${var.aws_region}"
  profile = "default"
}

data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.*-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_spot_instance_request" "minecraft" {
  ami           = "${data.aws_ami.amazon-linux-2.id}"
  instance_type = "${var.instance_type}"
  key_name      = "minecraft"
  security_groups = ["${aws_security_group.default.name}"]
  user_data = "${file("startup.sh")}"
  block_duration_minutes="${var.time_limit}"
  spot_type="one-time"
  wait_for_fulfillment="true"

  tags = {
    Name = "Minecraft"
  }
  availability_zone="us-west-2a"
  # availability_zone="None"
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdm"
  volume_id   = "${var.volume_id}"
  instance_id = "${aws_spot_instance_request.minecraft.spot_instance_id}"
}

# Our default security group to access
# the instances over SSH and HTTP
resource "aws_security_group" "default" {
  name        = "minecraft_sg"
  description = "Used in the terraform"

  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access from anywhere
  ingress {
    from_port   = 25565
    to_port     = 25565
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}