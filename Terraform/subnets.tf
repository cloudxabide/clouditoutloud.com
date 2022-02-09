# subnets.tf 

# Create public subnet for bastion
resource "aws_subnet" "public-1" {
  vpc_id                  = aws_vpc.ciol_devkit.id
  cidr_block              = var.subnets_public_cidr
  map_public_ip_on_launch = "true" //it makes this a public subnet
  availability_zone       = var.availability_zone
  tags = {
    Name             = "${var.project_name} - VPC Route Table"
    Owner            = var.project_owner
    Environment      = var.project_env
  }
}
