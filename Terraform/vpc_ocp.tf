# vpc.tf
# Create VPC and VPC resources

resource "aws_vpc" "ciol_devkit" {
    cidr_block           = var.vpc_cidr_block
    enable_dns_support   = "true" # gives you an internal domain name support
    enable_dns_hostnames = "true" # gives you an internal host name support
    enable_classiclink   = "false"
    instance_tenancy     = "default"    

    tags = {
        Name             = "${var.project_name} - Staging VPC"
        Owner            = var.project_owner
        Environment      = var.project_env
    }
}

# Internet Gateway
resource "aws_internet_gateway" "ciol_devkit" {
  vpc_id          = aws_vpc.ciol_devkit.id
  tags = {
    Name          = "${var.project_name} - Internet Gateway"
    Owner            = var.project_owner
    Environment      = var.project_env
  }
}

# Route Table 
resource "aws_route_table" "ciol_devkit" {
  vpc_id          = aws_vpc.ciol_devkit.id
  tags = {
    Name          = "${var.project_name} - VPC Route Table"
    Owner            = var.project_owner
    Environment      = var.project_env
  }
}

# Route 
resource "aws_route" "ciol_devkit" {
  route_table_id         = aws_route_table.ciol_devkit.id
  destination_cidr_block = var.destination_cidr_block
  gateway_id             = aws_internet_gateway.ciol_devkit.id
}

# Route Table Association
resource "aws_route_table_association" "ciol_devkit" {
  subnet_id              = aws_subnet.public-1.id
  route_table_id         = aws_route_table.ciol_devkit.id
}
