resource "azurerm_public_ip" "pip" {
    for_each = var.puip
  name                = each.value.pipname
  resource_group_name = each.value.rgname
  location            = each.value.location
  allocation_method   = "Static"
  sku                 = "Standard"


}