packer {
  required_plugins {
    vagrant = {
      version = ">= 0.0.7"
      source  = "github.com/hashicorp/vagrant"
    }
  }
}

build {
  sources = ["source.vagrant.training-example"]
  provisioner "file" {
    source      = var.upload_file
    destination = "/home/${var.ssh_username}/${var.upload_file}"
  }

  provisioner "shell" {
    inline = ["sudo apt update && sudo apt install -y redis-server"]
  }
}
