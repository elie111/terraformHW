#vpc
resource "aws_default_vpc" "default_vpc" {
  tags = {
    Name = "Default VPC"
  }
}
#subnet
resource "aws_default_subnet" "default_subnet" {
  availability_zone = "${var.region}a"

  tags = {
    Name = "Default subnet for eu-central-1a"
  }
}

resource "aws_lb_target_group" "app_server_tg_port_22" {
  name                = "app-server-tg-port-22"
  port                = 22
  protocol            = "TCP"
  target_type         = "instance"
  vpc_id              = aws_vpc.default_vpc.id
  health_check {
    port                = 22
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  }
}

resource "aws_lb_target_group" "app_server_tg_port_80" {
  name                = "app-server-tg-port-80"
  port                = 80
  protocol            = "HTTP"
  target_type         = "instance"
  vpc_id              = aws_vpc.default_vpc.id
  health_check {
    path                = "/health"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }
}

resource "aws_lb_target_group" "app_server_tg_port_443" {
  name                = "app-server-tg-port-443"
  port                = 443
  protocol            = "HTTPS"
  target_type         = "instance"
  vpc_id              = aws_vpc.default_vpc.id
  health_check {
    path                = "/health"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }
}

resource "aws_lb_target_group_attachment" "aws_lb_tg_attachment_port_80" {
  target_group_arn = aws_lb_target_group.app_server_tg_port_80.arn
  target_id        = aws_instance.app_server.id
  port             = 80
}


resource "aws_lb_target_group_attachment" "aws_lb_tg_attachment_port_22" {
  target_group_arn = aws_lb_target_group.app_server_tg_port_22.arn
  target_id        = aws_instance.app_server.id
  port             = 22
}


resource "aws_lb_target_group_attachment" "aws_lb_tg_attachment_port_443" {
  target_group_arn = aws_lb_target_group.app_server_tg_port_443.arn
  target_id        = aws_instance.app_server.id
  port             = 443
}


resource "aws_instance" "app_server" {
  instance_type      = var.instance_type
  availability_zone = "${var.region}a"
  subnet_id          = aws_default_subnet.default_subnet.id
  ami                = var.ami
  key_name           = var.Key_name
  associate_public_ip_address = true
  user_data = file("${var.shell_script_name}.sh")

  tags = {
   Name = var.instance_name
  }
}