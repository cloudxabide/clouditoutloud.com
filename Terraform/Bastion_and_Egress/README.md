# README

## Purporse
This directory is a set of Terraform files to create VPC resources for a Bastion EC2 instance with Egress - Bastion and Egress (bne).
This provides an easier experience to build a AWS Private Cluster for OpenShift Container Platform.

## Using this Code
Review all the files, and update the files from the list below marked with a Y 

| File Name | Update | Purpose |
|:----------|:------:|:--------|
| README.md | N | |
| ec2.tf | N | Defines the EC2 instance to deploy for a bastion |
| main.tf | N | |
| mock.tfvars | Y | |
| outputs.tf | N | |
| provider.tf | N | |
| security_group_default.tf | N | |
| subnets.tf | N | |
| tfvars.template | N | |
| variables.tf | Y | |
| vpc.tf | Y | |

```
cp tfvars.template bastion_and_egress.tfvars
vi bastion_and_egress.tfvars
```

Terraform has a hierarchy of dependencies

## Let's Build some Cloud...

```
terraform init
```

```
terraform plan --var-file=./bastion_and_egress.tfvars
```

```
terraform apply --var-file=./bastion_and_egress.tfvars
```

```
terraform destroy --var-file=./bastion_and_egress.tfvars
```
