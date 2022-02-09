# outputs.tf

output "public_dns" {
  description = "List of public DNS names assigned to the instances. For EC2-VPC, mock-node is only available if you've enabled DNS hostnames for your VPC"
  value       = aws_instance.ciol-mock.*.public_dns
}

