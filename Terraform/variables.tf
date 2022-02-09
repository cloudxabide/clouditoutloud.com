# variables.tf
#         The farther down this file, the less likely it is that you 
#           should need to modify the value that is being set.
#     Trying to follow Terraform Naming Conventions
#     DO NOT POPULATE THE VARIABLES IN THIS FILE - use terraform.tfvars
# 

variable "project_name" {
  description = "Moniker to identify what this infrastructure is for"
}
variable "project_owner" {
  description = "Owner of the infrastructure being deployed"
}
variable "project_env" {
  description = <<DESCRIPTION
Free form string to identify the *environment* this will be tagged as.

DESCRIPTION
}
variable "domain_name_tld" {
  description = "Top Level Domain Name to use (where valid)"
}
variable "aws_profile" {
  description  = "AWS Profile to be used to create the infrastructure"
}
variable "aws_region" {
  description = "AWS Region to deplay IaC"
}
variable "availability_zone" {
  description = "Availability Zone(s) to deploy IaC"
}
variable "key_pair_name" {
  description = "Key Pair Name for SSH key for instances"
}
variable "public_key_path" {
  description = <<DESCRIPTION
Path to SSH public key file.

Example: ~/.ssh/my-environment.pub

DESCRIPTION
}
variable "ami_owner_redhat_rhel" {
  description = <<DESCRIPTION
AWS Owner ID for the account providing the Red Hat Ent Linux AMI
  Red Hat - Commercial = 309956199498
  Red Hat - GovCloud   = 219670896067

DESCRIPTION
}
variable "ami_owner_redhat_coreos" {
  description = <<DESCRIPTION
AWS Owner ID for the account providing the Red Hat CoreOS AMI
  Red Hat - OCP Dev (CoreOS) = 531415883065
NOTE: This "owner id" only works in AWS Commercial

DESCRIPTION
}
# 
# =============================================================================
## TYPICALLY MODIFIED VARIABLES - END
# =============================================================================
#

# =============================================================================
data "aws_caller_identity" "current" {}

variable "dnsSupport" {
  default = true
}
variable "dnsHostNames" {
  default = true
}
variable "instanceTenancy" {
  default = "default"
}

# =============================================================================
# Network Info
# =============================================================================
variable "vpc_cidr_block" {
  default   = "10.160.0.0/16"
}
variable "subnets_public_cidr" {
  type      = string 
  default   = "10.160.0.0/22"
}
variable "destination_cidr_block" {
  default = "0.0.0.0/0"
}
variable "source_cidr_block" {
  default = "0.0.0.0/0"
}

# =============================================================================
# AMI Info
# =============================================================================
data "aws_ami" "rhel82_latest" {
  owners      = [var.ami_owner_redhat_rhel]
  most_recent = true

  filter {
    name      = "name"
    values    = ["RHEL-8.2*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}
# =============================================================================
# Instance Info
# =============================================================================
variable "staging_bastion" {
  type      = string
  default   = "t3.micro"
}

