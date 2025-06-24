resource "aws_security_group" "private" {
  name = "private-sg"
  description = "for my Bakcnend app"
  vpc_id =var.vpc_id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = var.public_subnet_cidrs

  }

  ingress {
    from_port = 9090
    to_port = 9090
    protocol = "tcp"
    cidr_blocks = var.public_subnet_cidrs

  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = "private-sg"
  }
}