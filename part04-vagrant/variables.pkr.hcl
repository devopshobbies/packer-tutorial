variable "ssh_username" {
  type    = string
  default = "vagrant"
}

variable "ssh_password" {
  type    = string
  default = "vagrant"
}

variable "upload_file" {
  type    = string
  default = "to_upload.txt"
}

variable "user" {
  type    = string
  default = "rojin"
}

variable "vagrant_box" {
  type    = string
  default = "/home/rojin/Downloads/trusty-server-cloudimg-amd64-vagrant-disk1.box"
}

variable "output_dir" {
  type    = string
  default = "./vagrant-output-box"
}

variable "vagrant_provider" {
  type    = string
  default = "virtualbox"
}

variable "synced_folder_path" {
  type    = string
  default = "./vagrant_storage"
}

