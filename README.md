# clouditoutloud.com
CloudItOutLoud is second-level domain for my Cloud (public and hybrid) playground.  

I will be testing several iterations of different products/services/projects.  Each represented by a third-level domain.

| Domain                    | Purpose/Goal                          | Repo URL |
|:--------------------------|:--------------------------------------|:---|
| clouditoutloud.com        | Second-level domain for my adventures | https://github.com/cloudxabide/clouditoutloud.com |
| eks.clouditoutloud.com    | Testing EKS in AWS                    | https://github.com/cloudxabide/eks.clouditoutloud.com |
| ocp.clouditoutloud.com    | Testing OpenShift (IPI in AWS         | https://github.com/cloudxabide/ocp.clouditoutloud.com | 
| rosa.clouditoutloud.com   | (future) testing ROSA                 | N/A | 


## Overview





## Original Plan....
![Environment Overview](Images//Environment_Mockup_Private_Cluster.png)

For a "AWS private cluster" installation, we (now) need to create:

Cluster Resources:

* Subnets
* Route tables
* VPCs
* VPC DHCP options
* VPC endpoints

Bastion and Egress (bne) Resources:

* Internet gateways
* NAT gateways

Additionally, we will need an EC2 instance to run as a bastion (since a remote bastion cannot access the resources as there will be no publicly accessible endpoints.

## Notes
We will use a /24 (initially) for the OCP4 VPC CIDR and 3 AZs (1 Private Subnet per AZ)  
and a /24 for the BnE VPC CIDR with 1 AZ (1 Public, 1 Private)

## References
https://docs.openshift.com/container-platform/4.9/installing/installing_aws/installing-aws-private.html
https://docs.aws.amazon.com/vpc/latest/tgw/transit-gateway-nat-igw.html
