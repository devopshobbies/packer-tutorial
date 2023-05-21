source "docker" "ubuntu" {
  image = var.image_name
  # Commit the container to an image
  commit = true
}