resource "aws_network_interface" "current" {
  subnet_id       = var.subnet_id
  security_groups = [aws_security_group.current.id]
}

resource "aws_launch_template" "current" {

  ebs_optimized = true
  key_name      = aws_key_pair.current.id
  iam_instance_profile {
    name = aws_iam_instance_profile.current.name
  }
  image_id = var.image_id
  instance_market_options {
    market_type = "spot"
  }
  instance_type = var.instance_type
  network_interfaces {
    associate_public_ip_address = true
    network_interface_id        = aws_network_interface.current.id
  }
  placement {
    availability_zone = var.availability_zone[0]
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = var.instance_name
    }
  }

}

resource "aws_autoscaling_group" "current" {
  name = var.instance_name
  launch_template {
    id      = aws_launch_template.current.id
    version = aws_launch_template.current.latest_version
  }

  min_size                  = var.min_size
  max_size                  = var.max_size
  desired_capacity          = var.desired_capacity
  availability_zones        = var.availability_zone
  health_check_grace_period = var.health_check_grace_period
  default_cooldown          = var.default_cooldown

}

resource "aws_key_pair" "current" {
  public_key = var.ssh_key
}

resource "aws_cloudwatch_log_group" "current" {
  name              = "${var.instance_name}_instance"
  retention_in_days = var.retention_in_days
}