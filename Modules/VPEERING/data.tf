data "azurerm_virtual_network" "example" {
    for_each = var.vpeer
  name                = each.value.rvname
  resource_group_name = each.value.rvrgname
}