data "azurerm_subnet" "example" {
for_each = var.nic
  name                 = each.value.sname
  virtual_network_name = each.value.vname
  resource_group_name  = each.value.rgname
}

data "azurerm_public_ip" "example" {
  for_each = var.nic
  name                = each.value.pipname
  resource_group_name = each.value.rgname
}
