provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "devops-tf-assesment-2022-03"
    key    = "demo-tf-assignment/terraform.tfstate"
    region = "us-east-1"
  }
}
