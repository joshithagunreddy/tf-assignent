# Define Variables
component         = "tf-assignment"
region            = "us-east-1"
cidr_vpc          = "10.0.0.0/16"
subnet_cidr_block = ["10.0.1.0/24", "10.0.2.0/24"]
ami_id            = "ami-0c02fb55956c7d316"
public_key        = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCl8kYd4uiGu4Q44BUEb65How/lTieO0lJLbk5hlredFMuhPXvo8NXdGDzNPq/aa5eUxe0QCvhSjk1GiOTkXZnL4fN4eh7RXgXCKkS+qEiEzzafx0/scoDvJjxXl/FBOE/DhW0QfSs4p8h6Iqh9lj66/CcLu7ysvhtQG6rGb+05fdtNMTwQwl2G/938iDCOn985R27V8FS8WbjkQwNWAm+bS4BOfbUrBTD/9+T4nFFn4PNmzG/RxunARj3g3NhQ8E16f1GyLidFmUsAsXD+qUyemMIWYmsV9HOhVgPNbpMzAvt+/NuOjRcDZaHH4qB21DmF7bxU5ahHW75A4HDGEqa5 ec2-user@ip-172-31-92-217.ec2.internal"
instance_type     = "t2.micro"
tfstate-bucket    = "devops-tf-assesment-2022-03"
prefix            = "demo-tf-assesment/default.tfstate"
