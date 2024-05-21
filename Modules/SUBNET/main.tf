resource "azurerm_subnet" "sn" {
    for_each = var.snet
  name                 = each.value.sname
  resource_group_name  = each.value.rgname
  virtual_network_name = each.value.vname
  address_prefixes     = each.value.address_prefixes


  
}
