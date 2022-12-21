# internal load balancer
resource "aws_lb" "internal_lb" {
  name               = "internal-lb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = [aws_default_subnet.default_subnet.id, aws_default_subnet.default_subnet_2.id]

  tags = {
    Name = "Internal Load Balancer"
  }
}

resource "aws_lb_listener" "internal_lb_listener" {
  load_balancer_arn = aws_lb.internal_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
  }
}

resource "aws_lb" "internet_facing_lb" {
  name               = "internet-facing-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = [aws_default_subnet.public_subnet_1.id, aws_default_subnet.public_subnet_2.id]

  tags = {
    Name = "Internet-Facing Load Balancer"
  }
}

resource "aws_lb_listener" "internet_facing_lb_listener" {
  load_balancer_arn = aws_lb.internet_facing_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
  }
}

resource "aws_lb_listener" "internet_facing_lb_listener" {
  load_balancer_arn = aws_lb.internet_facing_lb.arn
  port              = "443"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
  }
}

resource "aws_lb_listener" "internet_facing_lb_listener" {
  load_balancer_arn = aws_lb.internet_facing_lb.arn
  port              = "22"
  protocol          = "TCP"

  default_action {
    type             = "forward"
  }
}