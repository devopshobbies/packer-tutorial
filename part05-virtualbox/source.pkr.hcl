source "virtualbox-iso" "basic-example" {
  guest_os_type = "Ubuntu_64"
  iso_url       = var.iso_url
  iso_checksum  = var.iso_checksum
  ssh_username  = var.ssh_username
  ssh_password  = var.ssh_password
  ssh_timeout   = "60m"
  disk_size     = "15000"
  boot_command = [
    "<enter><wait>",
    "<f6><esc>",
    "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
    "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
    "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
    "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
    "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
    "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
    "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
    "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
    "<bs><bs><bs>",
    "/install/vmlinuz ",
    "initrd=/install/initrd.gz ",
    "net.ifnames=0 ",
    "auto-install/enable=true ",
    "debconf/priority=critical ",
    "preseed/url=http://{{.HTTPIP}}:{{.HTTPPort}}/preseed.cfg",
    "<enter>"
  ]
  shutdown_command = "echo 'packer' | sudo -S shutdown -P now"
  vboxmanage = [
    ["modifyvm", "{{.Name}}", "--memory", "1024"],
    ["modifyvm", "{{.Name}}", "--cpus", "2"],
  ]
  export_opts = [
    "--manifest",
    "--vsys", "0",
    "--description", "${var.vm_description}",
    "--version", "${var.vm_version}"
  ]
  format = "ova"




}

