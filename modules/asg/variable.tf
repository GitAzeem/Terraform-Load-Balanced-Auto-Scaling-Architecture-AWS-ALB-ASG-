variable "name" {
  type = string
  description = "asg name prefix"
}

variable "launch_temp_id" {
  type = string
  description = "launch template to use"
}

variable "subnet_ids" {
  type = list(string)
  description = "subnets on which to scale on"
}

variable "min" {
  type = number
  description = "minimum number of instances to maintain all time"
  default = 2
}

variable "max" {
  type = number
  description = "maximum number of instances that asg can scale out to"
  default = 6
}

variable "declared_size" {
    type = number
    description = "ideal no of instances asg tires to maintain"
    default = 4
}

variable "target_group_arns" {
  type        = list(string)
  description = "ALB target group ARNs to attach"
  default     = []
}