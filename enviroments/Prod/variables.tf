variable "vpc_cidr" {}
variable "public_subnets" {
  type = list(string)
}
variable "private_subnets" {
  type = list(string)
}
variable "azs" {
  type = list(string)
}
variable "name_tag" {}
variable "vpc-name" {}



variable "ami_id" {}
variable "instance_type" {}
variable "key_name" {}


variable "min" {}


variable "max" {}


variable "declared_size" {}
