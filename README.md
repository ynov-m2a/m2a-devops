# DevOps repo for M2A


## Requirements

- Login in Azure via CLI `az login`
- Create [OIDC for Azure](https://learn.microsoft.com/en-us/azure/developer/github/connect-from-azure?tabs=azure-cli%2Clinux)

## Steps
- `terraform init`
- `terraform login`
- `terraform validate`
If you want to apply only the aks module : 
- `terraform apply` > `yes`

## Terraform Cloud
- Add the SSH public key in [Terraform Cloud variables]("https://app.terraform.io/app/M2A/workspaces/m2a-workspace/variables") using your app and workspace instead of  `app/M2A/workspaces/m2a-workspace`
- Add following secrets to Terraform Cloud variables (avalaible from Azure Service Principal : `App registrations`) : 
    - ARM_CLIENT_ID 
    - ARM_CLIENT_SECRET 
    - ARM_SUBSCRIPTION_ID 
    - ARM_TENANT_ID 