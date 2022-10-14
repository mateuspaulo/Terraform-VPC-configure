variable "cidr_vpc" {
  type = string
  default = "10.10.0.0/16"
}

variable "cidr_subnet_block_a" {
  type = string
  default = "10.10.32.0/24"
}

variable "cidr_subnet_block_b" {
  type = string
  default = "10.10.128.0/24"
}

variable "ip-ssh" {
  type = string
  default = "0.0.0.0/0"
}

variable "region" {
  type = string
  default = "us-east-1"
}