variable "ami_id" {
}

variable "instance_type" {
  
}

variable "key_name" {
  
}

variable "public_subnet_id" {
type = list(string)
}
variable "private_subnet_id" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "public_instance_count" {
  type = number
  default = 2
}

variable "private_instance_count" {
  type    = number
  default = 2
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_azs" {
  type = list(string)
}
