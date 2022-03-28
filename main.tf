module "vpc-with-ec2-autoscaling" {
  source            = "./modules/vpc-ec2-autoscaling"
  region            = var.region
  instance_size     = var.instance_size
  component       = var.component
  ami_id          = var.ami_id
  subnet_cidr_block = var.subnet_cidr_block
  public_key        = var.public_key
}
