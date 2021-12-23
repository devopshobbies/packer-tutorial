source "amazon-ebs" "ansible-image" {
  region        = var.region
  profile       = var.profile
  ami_name      = "Ansible-${local.timestamp}"
  instance_type = var.instance_type
  encrypt_boot  = true
  source_ami    = data.amazon-ami.ansible.id
  ssh_username  = "ubuntu"
  tags = {
    Name          = "Ansible-${local.timestamp}"
    Base_AMI_ID   = "{{ .SourceAMI }}"
    Base_AMI_Name = "{{ .SourceAMIName }}"
    ENV           = var.environment
  }
}
