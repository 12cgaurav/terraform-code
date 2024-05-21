resource "azurerm_network_security_group" "example" {
    for_each = var.nsg
  name                = each.value.nsgname
  location            = each.value.location
  resource_group_name = each.value.rgname

  dynamic "security_rule" {
    for_each = each.value.srule
    content {
    name                       = security_rule.value.name
    priority                   = security_rule.value.priority
    direction                  = security_rule.value.direction
    access                     = security_rule.value.access
    protocol                   = security_rule.value.protocol
    source_port_range          = security_rule.value.source_port_range
    destination_port_range     = security_rule.value.destination_port_range
    source_address_prefix      = security_rule.value.source_address_prefix
    destination_address_prefix = security_rule.value.destination_address_prefix
    }
    
  }

}
  resource "azurerm_subnet_network_security_group_association" "example" {
    for_each = var.nsg
  subnet_id                 = data.azurerm_subnet.example[each.key].id
  network_security_group_id = azurerm_network_security_group.example[each.key].id
}




