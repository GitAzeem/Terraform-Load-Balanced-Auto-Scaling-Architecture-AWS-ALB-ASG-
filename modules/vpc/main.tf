resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
      Name=var.name_tag
    }
}   

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    "Name"="${var.name_tag}-igw"
  }
  
}




resource "aws_subnet" "public_subnets" {
  count = length(var.public_subnets)
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnets[count.index]
  availability_zone = var.azs[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.vpc_name}-public-${count.index}"
  }
}

resource "aws_subnet" "private_subnets" {
  count = length(var.private_subnets)
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_subnets[count.index]
  availability_zone = var.azs[count.index]
  tags = {
    Name = "${var.vpc_name}-private-${count.index}"
  }
}




resource "aws_eip" "nat" {
  domain = "vpc"
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat.id
  subnet_id = aws_subnet.public_subnets[0].id
  tags = {
    Name = "${var.vpc_name}-nat"
  }
}


resource "aws_route_table" "public_rt" {
  vpc_id=aws_vpc.main.id
  route  {
    cidr_block="0.0.0.0/0"
    gateway_id=aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.vpc_name}-public-rt"
  }
}

resource "aws_route_table_association" "public_rt_ass" {
  route_table_id = aws_route_table.public_rt.id
  count = length(var.public_subnets)
  subnet_id = aws_subnet.public_subnets[count.index].id
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ngw.id
  }

  tags = {
    Name = "${var.vpc_name}-private-rt"
  }
  
}

resource "aws_route_table_association" "private_rt_ass" {
  route_table_id = aws_route_table.private_rt.id
  count = length(var.private_subnets)
  subnet_id = aws_subnet.private_subnets[count.index].id
}