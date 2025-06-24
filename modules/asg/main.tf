resource "aws_autoscaling_group" "this" {
  name_prefix          = "${var.name}-asg-"
  vpc_zone_identifier  = var.subnet_ids 
  min_size             = var.min
  max_size             = var.max
  desired_capacity     = var.declared_size
  health_check_type    = "ELB"  # Changed from EC2 to ELB for ALB integration
  target_group_arns    = var.target_group_arns  # New for ALB attachment

  launch_template {
    id      = var.launch_temp_id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = var.name
    propagate_at_launch = true
  }
}