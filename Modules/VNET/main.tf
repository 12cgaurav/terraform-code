resource "azurerm_virtual_network" "vnet" {
    for_each = var.vnet
  name                = each.value.vname
  location            = each.value.location
  resource_group_name = each.value.rgname
  address_space       = each.value.adspace
    dynamic "subnet" {
      for_each = contains(keys(each.value), "subnets") ? each.value.subnets : {}
      content {
    name           = subnet.value.sname
    address_prefix = subnet.value.address_prefixes
      }
    
  }


}