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
    "source.amazon-ebs.eks-image"
  ]

  provisioner "shell" {
    environment_vars = [
      "FOO=hello world",
    ]
    inline = [
      "echo install htop",
      "sleep 30",
      "sudo apt-get update",
      "sudo apt-get install htop top nmon mc -y"
      "sudo apt-get install software-properties-common"
      "sudo add-apt-repository --yes --update ppa:ansible/ansible"
      "sudo apt-get -y install ansible"
      "sudo add-apt-repository --yes --update ppa:ansible/ansible"
    ]
  }
}
