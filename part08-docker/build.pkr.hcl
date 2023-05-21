packer {
    required_plugings {
        docker = {
            version = ">= 0.0.7"
            source = "github.com/hashicorp/docker"
        }
    }
}


build {
    name = var.build_name
    source =  [
        var.build_source
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
            path = "${var.image_name}.tar"
        }
    }
}