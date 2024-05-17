output "public_ip" {
  value = azurerm_public_ip.production_public_ip.ip_address
}