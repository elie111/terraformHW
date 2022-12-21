# Declare variables for the module
variable "number" {
  type    = number
  default = 4
}

variable "instancetype" {
  type    = string
  default = "t2.micro"
}