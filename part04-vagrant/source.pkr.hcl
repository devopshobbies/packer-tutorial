source "vagrant" "training-example" {
  communicator     = "ssh"
  ssh_username     = var.ssh_username
  ssh_password     = var.ssh_password
  ssh_timeout      = "60m"
  ssh_wait_timeout = "90s"
  insert_key       = true
  source_path      = var.vagrant_box
  provider         = var.vagrant_provider
  add_force        = true
  synced_folder    = var.synced_folder_path
  output_dir       = var.output_dir
}
