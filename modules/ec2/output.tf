output "public_instance_ids" {
  value = aws_instance.public[*].id
}

output "private_instance_id" {
  value = aws_instance.private[*].id
}

output "public_sg" {
  value = aws_security_group.public.id
}

output "private_sg" {
  value = aws_security_group.private.id
}
