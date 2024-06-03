# DevOps repo for M2A

## Requirements

- Create [OIDC for Azure](https://learn.microsoft.com/en-us/azure/developer/github/connect-from-azure?tabs=azure-cli%2Clinux)

## Steps for running Terraform locally
- `terraform init`
- `terraform login`
- `terraform validate`
If you want to apply only the aks module : 
- `terraform apply` > `yes`

## Terraform Cloud
- Add following secrets to Terraform Cloud variables (avalaible from Azure Service Principal : `App registrations`) : 
    - ARM_CLIENT_ID 
    - ARM_CLIENT_SECRET 
    - ARM_SUBSCRIPTION_ID 
    - ARM_TENANT_ID 

## GitHub Actions
- Create a TF_API_TOKEN secret in Github Actions variables