variable "vpc" {
  description = "your VPC name"
  type = string
}

variable "cidr_block" {
  description = "CIDR range"
  type = string
}

variable "cidr_block_subnet" {
  description = "CIDR range for subnet"
  type = string
}

variable "internet_gateway_name" {
  description = "IG name here"
  type = string
}

variable "subnet_public_name" {
  description = "subnet name here"
}

variable "routetable_name" {
    description = "route table name here"
    type = string  
}

variable "security_groups_name" {
  description = "security group name here"
  type = string
}

variable "aws_instance_name" {
  description = "instance name here"
  type = string
}
variable "ami" {
  description = "AMI ID for insance"
  type = string
}

variable "instance_type" {  
  description = "type of your instance"
  type = string
}