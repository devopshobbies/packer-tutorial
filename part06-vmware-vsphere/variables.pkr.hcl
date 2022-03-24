#Public variables
locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

variable "password" {
  type    = string
  default = "PassWord"
}

variable "ssh_password" {
  type    = string
  default = "PassWord"
}

variable "ssh_username" {
  type    = string
  default = "UserName"
}
