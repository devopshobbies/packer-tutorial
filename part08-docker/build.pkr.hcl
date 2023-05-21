packer {
  required_plugins {
    docker = {
      version = ">= 0.0.7"
      source  = "github.com/hashicorp/docker"
    }
  }
}


build {
  name = var.build_name
  sources = [
    var.build_source
  ]
  provisioner "shell" {
    environment_vars = [
      "FOO=example variable"
    ]
    inline = [
      "echo installing vim package",
      "apt-get update",
      "apt-get install vim -y",

    ]
  }

  post-processors {
    post-processor "docker-tag" {
      repository = var.build_repo
      tag        = var.build_tags
    }
    # Push to docker hub
    post-processor "docker-push" {
        # dont delete the docker image after pushing it to the cloud.
        keep_input_artifact = true
    }
    # Save to image file 
    post-processor "docker-save" {
      path = "${var.image_name}.tar"
    }
  }
}