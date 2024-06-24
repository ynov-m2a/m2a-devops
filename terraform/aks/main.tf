resource "azurerm_resource_group" "aks-rg" {
  name     = "${var.prefix}-aks-resources"
  location = var.location
}

resource "azurerm_virtual_network" "aks-vnet" {
  name                = "${var.prefix}-vnet"
  location            = azurerm_resource_group.aks-rg.location
  resource_group_name = azurerm_resource_group.aks-rg.name
  address_space       = ["192.168.0.0/16"]
}

resource "azurerm_subnet" "aks-subnet" {
  name                 = "${var.prefix}-subnet"
  resource_group_name  = azurerm_resource_group.aks-rg.name
  address_prefixes     = ["192.168.1.0/24"]
  virtual_network_name = azurerm_virtual_network.aks-vnet.name
}

resource "azurerm_kubernetes_cluster" "aks-cluster" {
  name                = "${var.prefix}-aks"
  location            = azurerm_resource_group.aks-rg.location
  resource_group_name = azurerm_resource_group.aks-rg.name
  dns_prefix          = "aks-dns-prefix"

  default_node_pool {
    name           = "akspool"
    node_count     = 1
    vm_size        = "Standard_B2ms"
    vnet_subnet_id = azurerm_subnet.aks-subnet.id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }
}

data "azurerm_public_ip" "aks-pip" {
  name                = reverse(split("/", tolist(azurerm_kubernetes_cluster.aks-cluster.network_profile.0.load_balancer_profile.0.effective_outbound_ips)[0]))[0]
  resource_group_name = azurerm_kubernetes_cluster.aks-cluster.node_resource_group
}