output "internet_facing_lb_arn" {
  value = aws_lb.internet_facing_lb1.arn
  description = "The ARN of the internet-facing load balancer"
}

output "internal_lb_arn" {
  value = aws_lb.internal_lb1.arn
  description = "The ARN of the internal load balancer"
}