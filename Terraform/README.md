# README

## Purporse
This directory is a set of Terraform files to create VPC resources for an OpenShift Private Cluster Installation

For a "private" installation, we (now) need to create: 

* Internet gateways (not needed)
* NAT gateways (not needed)
* Subnets
* Route tables
* VPCs
* VPC DHCP options
* VPC endpoints

Additionally, we will need an EC2 instance to run as a bastion (since a remote bastion cannot access the resources as there will be no publicly accessible endpoints.


## Notes
We will use a /24 (initially) for the VPC CIDR and 3 subnets (private)
## References
https://docs.openshift.com/container-platform/4.9/installing/installing_aws/installing-aws-private.html


