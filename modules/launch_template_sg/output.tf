output "launch_template_id" {
  value = aws_launch_template.template.id
}

output "launch_template_version" {
  value = aws_launch_template.template.latest_version
}

