module "aks" {
    source    = "./terraform/aks"
    prefix    = "m2a"
    location  = "francecentral"
}