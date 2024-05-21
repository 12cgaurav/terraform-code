data "azurerm_subnet" "example" {
for_each = var.bastion
  name                 = each.value.sname
  virtual_network_name = each.value.vname
  resource_group_name  = each.value.rgname
}
