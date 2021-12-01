source "amazon-ebs" "eks-image" {
  region        = var.region
  profile       = var.profile
  ami_name      = "Ansible-${local.timestamp}"
  instance_type = var.instance_type
  encrypt_boot  = true
  source_ami_filter {
    filters = {
      name                = var.AMI_name
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = [var.AMI_owners]
  }
  ssh_username = "ubuntu"
  tags = {
    Name          = "Ansible-${local.timestamp}"
    Base_AMI_ID   = "{{ .SourceAMI }}"
    Base_AMI_Name = "{{ .SourceAMIName }}"
    ENV           = var.environment
  }
}
