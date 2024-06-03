terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  cloud {
    organization = "M2A"

    workspaces {
      name = "m2a-workspace"
    }
  }
}

provider "azurerm" {
  features {}
}