resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_virtual_network" "example" {
  name                = "example-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "example" {
  name                 = "example-subnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "example" {
  name                = "example-pip"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Static"
}

resource "azurerm_application_gateway" "example" {
  name                = "example-appgateway"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku {
    name     = "Standard_Medium"
    tier     = "Standard"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "example-ip-configuration"
    subnet_id = azurerm_subnet.example.id
  }

  frontend_port {
    name = "example-frontend-port"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "example-frontend-ip"
    public_ip_address_id = azurerm_public_ip.example.id
  }

  ssl_certificate {
    name     = "example-ssl-cert"
    data     = "base64_encoded_certificate_data"
    password = "certificate_password"  # If your certificate is encrypted with a password
  }

  backend_address_pool {
    name = "example-backend-pool"
    fqdns = ["app1.example.com", "app2.example.com"]  # Replace with your backend server FQDNs
  }

   backend_http_settings {
    name                  = var.appgw.http_setting_name
    cookie_based_affinity = "Disabled"
    path                  = "/path1/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_settings {
    name                      = "example-http-settings"
    cookie_based_affinity     = "Disabled"
    port                      = 80
    protocol                  = "Http"
    request_timeout           = 20
  }

  http_listener {
    name                                = "example-http-listener"
    frontend_ip_configuration_name      = azurerm_application_gateway.example.frontend_ip_configuration[each.key].name
    frontend_port_name                  = azurerm_application_gateway.example.frontend_port[each.key].name
    protocol                            = "Https"
    ssl_certificate_name                = azurerm_application_gateway.example.ssl_certificate[each.key].name
  }

  request_routing_rule {
    name                       = "example-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = azurerm_application_gateway.example.http_listener[each.key].name
    backend_address_pool_name  = azurerm_application_gateway.example.backend_address_pool[each.key].name
    backend_http_settings_name = azurerm_application_gateway.example.http_settings[each.key].name
  }

  web_application_firewall_configuration {
    enabled               = true
    firewall_mode         = "Detection"
    rule_set_type         = "OWASP"
    rule_set_version      = "3.0"
  }
}
