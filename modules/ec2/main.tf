resource "aws_instance" "public" {
  count = var.public_instance_count
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [ aws_security_group.public.id ]
  subnet_id     = var.public_subnet_id[count.index]
    tags = {
    Name = "public-instance-${count.index + 1}"
  }
}


resource "aws_instance" "private" {
  count = var.private_instance_count
  ami=var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [ aws_security_group.private.id ]
  subnet_id = var.private_subnet_id[count.index]
  availability_zone = element(var.private_subnet_azs,count.index)

  tags = {
    Name="private-instance-${count.index + 1}"
  }
}