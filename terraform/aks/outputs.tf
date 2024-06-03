output "cluster_egress_ip" {
  value = data.azurerm_public_ip.aks-pip.ip_address
}