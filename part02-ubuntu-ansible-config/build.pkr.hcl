packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

# Adding script to install in image

build {
  name = var.ami_name
  sources = [
    "source.amazon-ebs.ansible-image"
  ]

  provisioner "shell" {
    environment_vars = [
      "FOO=hello world",
    ]
    script = "install-ansible.sh"
  }
}
