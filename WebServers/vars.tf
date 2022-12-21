
variable "region" {
  type = string
  default = "eu-central-1"
}

variable "access_key" {
  description = "AWS Access Key"
}

variable "secret_key" {
  description = "AWS Secret Key"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}


variable "instance_name" {
    type = string
    default = "web-server"
}

variable "Key_name" {
  type = string
  default = "elie_fursa"
}


variable "ami" {
  type = string
  default = "ami-0ff8a91507f77f867"
}

variable "shell_script_name" {
  type = string
}
