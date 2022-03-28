variable "region" {
  description = "Choose the region"
  default     = "us-east-1"
}

variable "component" {
  description = "environment name"
  default     = "tf-assesment"
}


variable "subnet_cidr_block" {}

variable "instance_size" {
  default = "t2.micro"
}

# Variable for VPC
variable "cidr_block" {
  default = "10.0.0.0/16"
}


# Declare the data source
data "aws_availability_zones" "azs" {}

variable "public_key" {}
variable "ami_id" {}
