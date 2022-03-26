packer {
  required_plugins {
    virtualbox = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/virtualbox"
    }
  }
}



# Adding script to install in image

build {
  sources = ["source.virtualbox-iso.basic-example"]

  provisioner "shell" {
    inline = ["sleep 30", "apt update", "apt install nginx -y"]
  }
}
