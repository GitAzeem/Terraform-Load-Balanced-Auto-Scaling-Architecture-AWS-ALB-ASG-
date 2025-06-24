resource "aws_ebs_volume" "extra_volume" {
  size = 5
  type="gp3"
  count=var.private_instance_count
  availability_zone = element(var.private_subnet_azs, count.index)
}

resource "aws_volume_attachment" "ebs_attachment" {
    count = var.private_instance_count
    device_name="/dev/sdh"
    volume_id = aws_ebs_volume.extra_volume[count.index].id
    instance_id=aws_instance.private[count.index].id
    force_detach = true
}