packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

# Adding script to install in image

build {
  name = "learn-packer"
  sources = [
    "source.amazon-ebs.ansible-image"
  ]

  provisioner "shell" {
    environment_vars = [
      "FOO=hello world",
    ]
    inline = [
      "echo -----------------install ansible config-----------------",
      "sleep 30",
      "sudo apt-get update",
      "sudo apt-get install htop nmon mc -y",
      "echo -----------------adding ansible repository-----------------",
      "sudo apt-get install software-properties-common",
      "sudo add-apt-repository --yes --update ppa:ansible/ansible",
      "echo -----------------install ansible-----------------",
      "sudo apt-get -y install ansible && ansible --version",
    ]
  }
}
