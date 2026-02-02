resource "aws_instance" "new_in_tf_ubuntu" {
  ami                         = "ami-08d59269edddde222"
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  key_name                    = "new"
  subnet_id                   = aws_subnet.public_subnet_b.id
  vpc_security_group_ids      = [aws_security_group.allow_tls.id]
  user_data = file("install.sh")
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name

  user_data_replace_on_change = true
  root_block_device {
    volume_size = 40
  }

  tags = {
    Name = "My-Ubuntu-Instance-cit-24-01-0396"
  }
}


resource "aws_instance" "new_in_tf_suse" {
  ami                         = "ami-0df7a207adb9748c7"
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  key_name                    = "new"
  subnet_id                   = aws_subnet.public_subnet_a.id
  vpc_security_group_ids      = [aws_security_group.allow_tls.id]
  user_data = file("linux.sh")
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name

  user_data_replace_on_change = true
  root_block_device {
    volume_size = 40
  }

  tags = {
    Name = "My-SUSE Linux-Instance-cit-24-01-0396"
  }
}



resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc_tf.id

  tags = {
    Name = "Project SG"
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Http"
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


resource "aws_lb_target_group" "web_tg" {
  name     = "cit-24-01-0396-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc_tf.id

  health_check {
    enabled             = true
    protocol            = "HTTP"
    path                = "/"
    port                = "80"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = {
    Name = "TG-CIT-24-01-0396"
  }
}
resource "aws_lb_target_group_attachment" "ubuntu_attach" {
  target_group_arn = aws_lb_target_group.web_tg.arn
  target_id        = aws_instance.new_in_tf_ubuntu.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "suse_attach" {
  target_group_arn = aws_lb_target_group.web_tg.arn
  target_id        = aws_instance.new_in_tf_suse.id
  port             = 80
}


resource "aws_lb" "app_lb" {
  name               = "cit-24-01-0396-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_tls.id]
  subnets            = [aws_subnet.public_subnet_a.id, aws_subnet.public_subnet_b.id]
  

  enable_deletion_protection = true

  
  tags = {
    Environment = "production"
  }
}
resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg.arn
  }
}




output "ec2_public_ip" {
  value = aws_instance.new_in_tf_ubuntu.public_ip
}

output "ec2_public_ip_suse" {
  value = aws_instance.new_in_tf_suse.public_ip
}

