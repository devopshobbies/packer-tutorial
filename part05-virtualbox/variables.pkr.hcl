#Public variables
locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

variable "iso_url" {
  type    = string
  default = "http://releases.ubuntu.com/16.04/ubuntu-16.04.2-server-amd64.iso"
}

variable "iso_checksum" {
  type    = string
  default = "737ae7041212c628de5751d15c3016058b0e833fdc32e7420209b76ca3d0a535"
}

variable "ssh_password" {
  type    = string
  default = "PassWord"
}

variable "ssh_username" {
  type    = string
  default = "UserName"
}

variable "vm_description" {
  type    = string
  default = "My Nginx Server"
}

variable "vm_version" {
  type    = string
  default = "1.0"
}