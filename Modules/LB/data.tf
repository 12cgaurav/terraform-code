data "azurerm_virtual_network" "example" {
  for_each = var.lb
  name                = each.value.vname
  resource_group_name = each.value.rgname
}

data "azurerm_virtual_machine" "example" {
    for_each = var.lb
  name                = each.value.vmname
  resource_group_name = each.value.rgname
}