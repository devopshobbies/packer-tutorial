packer {
  required_plugins {
    vsphere = {
      version = ">= 0.0.1"
      source = "github.com/hashicorp/vsphere"
    }
  }
}


# Adding script to install in image

build {
  sources = ["source.vsphere-iso.example"]

  provisioner "shell" {
    inline = ["sleep 30", "ls /", "echo "Done!" ]
  }
}

