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
      "sudo yum update",
      "sudo yum install htop -y"
    ]
  }
}