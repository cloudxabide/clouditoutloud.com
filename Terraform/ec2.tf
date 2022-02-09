# ec2.tf
resource "aws_instance" "ciol-staging" {
  ami                      = data.aws_ami.rhel82_latest.id
  instance_type            = var.staging_bastion
  vpc_security_group_ids   = [
    aws_security_group.allow_all_ssh.id,
    aws_security_group.default.id,
  ]
  key_name                 = aws_key_pair.default.key_name
  subnet_id                = aws_subnet.public-1.id
  tags = {
    Name             = "${var.project_name} - EC2 Instance"
    Owner            = var.project_owner
    Environment      = var.project_env
  }
}
