packer {
    required_plugings {
        docker = {
            version = ">= 0.0.7"
            source = "github.com/hashicorp/docker"
        }
    }
}

source "docker" "ubuntu" {
    image = "ubuntu:latest"
    # Commit the container to an image
    commit = true
}

build {
    name = "docker-example"
    source =  [
        "source.docker.ubuntu"
    ],
    provisioner "shell" {
        environment_vars = [
            "FOO=example variable"
        ]
        inline = [
            "echo installing vim package"
            "sleep 30"
            "sudo apt update"
            "sudo apt install vim -y"

        ]
    }

    post-processors {
        post-processor "docker-tag" {
            repository = "hashicorp/packer" # Your Repo
            tag = ["0.6","anothertag"]
        }
        # Push to docker hub
        post-processor "docker-push" {}
        # Save to image file 
        post-processor "docker-save" {
            path = "${image}.tar"
        }
    }
}