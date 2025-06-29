variable "ami_id" {
  type        = string
  description = "AMI ID to use"
}

variable "instance_type" {
  type        = string
  description = "Instance type"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID"
}

variable "name" {
  type        = string
  description = "Name tag for EC2"
  default     = "MyEC2"
}
