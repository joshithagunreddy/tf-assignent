
resource "aws_security_group" "elb_sg" {
  name        = "${var.component}-elb-sg"
  description = "Allow incoming http traffic"
  vpc_id      = aws_vpc.custom.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_elb" "elb" {
  name            = "${var.component}-elb"
  subnets         = "${aws_subnet.public.*.id}"
  security_groups = ["${aws_security_group.elb_sg.id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 3
    timeout             = 10
    target              = "HTTP:80/"
    interval            = 30
  }
  cross_zone_load_balancing = true

  tags = {
    Name = "${var.component}-elb"
  }
}



resource "aws_autoscaling_group" "asg" {
  name     = "${var.component}-asg"
  max_size = 3
  min_size = 1

  # desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  load_balancers            = ["${aws_elb.elb.name}"]
  force_delete              = true
  vpc_zone_identifier       = "${aws_subnet.public.*.id}"
  launch_configuration      = aws_launch_configuration.asg-config.id
}


resource "aws_launch_configuration" "asg-config" {
  image_id        = var.ami_id
  instance_type   = var.instance_size
  key_name        = aws_key_pair.instance_key.key_name
  user_data       = <<EOF
  #!/bin/bash
  sudo yum update -y
  sudo amazon-linux-extras install nginx1
  sudo systemctl start nginx
  sudo systemctl enable nginx
  EOF
  security_groups = ["${aws_security_group.sg.id}"]
}
