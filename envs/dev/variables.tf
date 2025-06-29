variable "region" {
  default = "us-east-1"
}

variable "ami_id" {}

variable "instance_type" {
  default = "t2.micro"
}

variable "subnet_id" {}

variable "name" {
  default = "DevEC2"
}
