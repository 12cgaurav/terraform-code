resource "azurerm_public_ip" "example" {
  for_each = var.bastion
  name                = each.value.pipname
  location            = each.value.location
  resource_group_name = each.value.rgname
  allocation_method   = "Static"
  sku                 = "Standard"
}


resource "azurerm_bastion_host" "example" {
    for_each = var.bastion
  name                = each.value.bastionname
  location            = each.value.location
  resource_group_name = each.value.rgname

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.example[each.key].id
    public_ip_address_id = azurerm_public_ip.example[each.key].id
  }
}