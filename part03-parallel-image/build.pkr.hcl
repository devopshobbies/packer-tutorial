packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
    docker = {
      version = ">= 0.0.7"
      source  = "github.com/hashicorp/docker"
    }
  }
}

# Adding script to install in image

build {
  name = "learn-packer"
  sources = [
    "source.amazon-ebs.ansible-image",
    "source.docker.ubuntu"
  ]

  provisioner "shell" {
    environment_vars = [
      "FOO=hello world",
    ]
    inline = [
      "echo Adding file to Docker Container",
      "echo \"FOO is $FOO\" > example.txt",
    ]
    only             = ["docker.ubuntu"]
  }

  provisioner "shell" {
    inline = ["echo Running ${var.docker_image} Docker image."]
    only             = ["docker.ubuntu"]
  }

  provisioner "shell" {
    environment_vars = [
      "FOO=hello world",
    ]
    inline = [
      "echo -----------------update ubuntu-----------------",
      "sleep 30",
      "sudo apt-get update",
    ]
    only             = ["amazon-ebs.ansible-image"]
  }
}
