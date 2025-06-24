locals {
  ami      = "ami-065deacbcaac64cf2"
  type     = "t2.micro"
  
}

variable "name_tag" {
   type        = string
   description = "Name of the EC2 instance"
}


variable "vpc_cidr" {
  description = "cidr range of vps/size of vpc"
  type=string
  default="10.0.0.0/16"
}

variable "vpc_name" {
  type = string
  description = "project name"
  default = "Demo project"
}

variable "public_subnets" {
  type = list(string)
  description = "public subnet ranges"
}

variable "private_subnets" {
  type=list(string)
  description = "private subnet range"
  
}

variable "azs" {
  type = list(string)
  description = "availability zone"
  
}