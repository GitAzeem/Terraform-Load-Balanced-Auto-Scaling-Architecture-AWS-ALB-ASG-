variable "name_prefix" {
  type        = string
  description = "Prefix for template name (e.g., 'public' or 'private')"
}

variable "vpc_id" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "public_subnet_cidrs" {
  type = list(string)
}


variable "sg_id" {
  description = "SG ID to be attached to private instances"
  type        = string
}

