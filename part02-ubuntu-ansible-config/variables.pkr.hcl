#Public variables
locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

#Environment variables
variable "environment" {
  type    = string
  default = "DevOps"
}

variable "profile" {
  type    = string
  default = "default"
}

variable "ami_name" {
  type    = string
  default = "learn-packer"
}