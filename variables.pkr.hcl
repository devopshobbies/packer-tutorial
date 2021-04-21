#Public variables
locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

#Image variable
variable "AMI_name" {
  type    = string
  default = "amazon-eks-node-1.21-v20220226"
}

variable "AMI_owners" {
  type    = string
  default = "602401143452"
}

#Environment variables
variable "environment" {
  type    = string
  default = "DevOps"
}

variable "profile" {
  type    = string
  default = "default"
}



variable "EKS_version" {
  type    = string
  default = "21"
}
