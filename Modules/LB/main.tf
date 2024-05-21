resource "azurerm_public_ip" "example" {
  for_each = var.lb
  name                = each.value.pipname
  location            = each.value.location
  resource_group_name = each.value.rgname
  allocation_method   = "Static"
  sku = "Standard"
}

resource "azurerm_lb" "example" {
  for_each = var.lb
  name                = each.value.lbname
  location            = each.value.location
  resource_group_name = each.value.rgname
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = each.value.fipcongname
    public_ip_address_id = azurerm_public_ip.example[each.key].id
  }
}

resource "azurerm_lb_backend_address_pool" "example" {
  for_each = var.lb
  loadbalancer_id = azurerm_lb.example[each.key].id
  name            = each.value.backaddpoolname
}

resource "azurerm_lb_backend_address_pool_address" "example" {
  for_each = var.lb
  name                    = each.value.backpooladd
  backend_address_pool_id = azurerm_lb_backend_address_pool.example[each.key].id
  virtual_network_id      = data.azurerm_virtual_network.example[each.key].id
  ip_address              = data.azurerm_virtual_machine.example[each.key].private_ip_address
}

resource "azurerm_lb_rule" "example" {
  for_each = var.lb
  loadbalancer_id                = azurerm_lb.example[each.key].id
  name                           = each.value.lbrulename
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = each.value.fipcongname
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.example[each.key].id]
  probe_id = azurerm_lb_probe.example[each.key].id
}

resource "azurerm_lb_probe" "example" {
  for_each = var.lb
  loadbalancer_id = azurerm_lb.example[each.key].id
  name            = each.value.probename
  port            = 22
}