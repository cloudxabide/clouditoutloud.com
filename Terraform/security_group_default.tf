# security_groups.tf

resource "aws_security_group" "default" {
  vpc_id        = aws_vpc.ciol_devkit.id

  ingress {
    protocol    = -1
    self        = true
    from_port   = 0
    to_port     = 0
    cidr_blocks = [var.source_cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.destination_cidr_block]
  }

  tags = {
    Name             = "${var.project_name} - VPC Route Table"
    Owner            = var.project_owner
    Environment      = var.project_env
  }
}

resource "aws_security_group" "allow_all_ssh" {
  name          = "allow_all_ssh"
  description   = "Allow inbound SSH traffic from ALL"
  vpc_id        = aws_vpc.ciol_devkit.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.source_cidr_block]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.destination_cidr_block]
  }
  tags = {
    Name             = "${var.project_name} - VPC Route Table"
    Owner            = var.project_owner
    Environment      = var.project_env
  }
}

#########################
##### NACL - default
#########################

resource "aws_default_network_acl" "default" {
#  vpc_id                  = aws_vpc.ciol_devkit.id
  default_network_acl_id  = aws_vpc.ciol_devkit.default_network_acl_id
  subnet_ids              = [ aws_subnet.public-1.id ]

  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    cidr_block = var.source_cidr_block
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    cidr_block = var.destination_cidr_block
  }
  tags = {
    Name             = "${var.project_name} - VPC Route Table"
    Owner            = var.project_owner
    Environment      = var.project_env
  }
}
