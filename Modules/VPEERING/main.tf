resource "azurerm_virtual_network_peering" "peer" {
    for_each = var.vpeer
  name                         = each.value.name
  resource_group_name          = each.value.rgname
  virtual_network_name         = each.value.vname
  remote_virtual_network_id    = data.azurerm_virtual_network.example[each.key].id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}