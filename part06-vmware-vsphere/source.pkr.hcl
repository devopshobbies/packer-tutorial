source "vsphere-iso" "example" {
  CPUs                 = 1
  RAM                  = 1024
  RAM_reserve_all      = true
  boot_command         = ["<enter><wait><f6><wait><esc><wait>",
                          "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
                          "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
                          "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
                          "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
                          "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
                          "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
                          "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
                          "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
                          "<bs><bs><bs>", "/install/vmlinuz",
                          " initrd=/install/initrd.gz", " priority=critical",
                          " locale=en_US", " file=/media/preseed.cfg",
                          "<enter>"]
  disk_controller_type = ["pvscsi"]
  floppy_files         = ["${path.root}/preseed.cfg"]
  guest_os_type        = "ubuntu64Guest"
  host                 = "esxi-1.vsphere65.test"
  insecure_connection  = true
  iso_paths            = ["[datastore1] ISO/ubuntu-16.04.3-server-amd64.iso"]
  network_adapters {
    network_card = "vmxnet3"
  }
  password     = var.password
  ssh_password = var.ssh_password
  ssh_username = var.ssh_username
  storage {
    disk_size             = 32768
    disk_thin_provisioned = true
  }
  username       = "root"
  vcenter_server = "vcenter.vsphere65.test"
  vm_name        = "example-ubuntu"
}
