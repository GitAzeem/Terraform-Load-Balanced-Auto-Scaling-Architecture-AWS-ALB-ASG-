resource "aws_launch_template" "template" {
  name_prefix   = "${var.name_prefix}-"
  image_id = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [ var.sg_id]

  lifecycle {
    create_before_destroy = true
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "public-template-instance"
    }
  }
}   