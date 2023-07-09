# Overview  

Please see blog site https://devbuildit.com/2023/01/24/basic-plotting-using-aws-jupyter-notebooks for detailed explaination of this repo contents.

This repo (and associated blog) will help you to produce a plot as shown below using Jupyther Notebooks on AWS infrastructure.

![Demo Plot1](./images/Jupyther01-output.png)


## Requirements:
- AWS Account
- Terraform CLI installed with access to your target AWS account (via temporary Indentity centre credentials or AWS IAM access keys)

## Deployment
- Clone repo into a source folder
- Update file terraform.tfvars to suit your environment
- Run command 'Terraform init' in source folder
- Run command 'Terraform plan' in source folder
- Run command 'Terraform apply' in source folder and approve apply

