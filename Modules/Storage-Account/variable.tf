resource "azurerm_storage_account" "example" {
  name                     = "mystorageaccount"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  enable_https_traffic_only = true

  tags = {
    environment = "production"
    team        = "devops"
  }

  lifecycle {
    prevent_destroy = true
  }

  network_rules {
    default_action             = "Deny"
    bypass                     = ["Metrics", "Logging"]
    ip_rules                   = ["0.0.0.0/32"]
    virtual_network_subnet_ids = [azurerm_subnet.example.id]
  }

  cors_rule {
    allowed_headers    = ["*"]
    allowed_methods    = ["GET", "POST"]
    allowed_origins    = ["*"]
    exposed_headers    = ["*"]
    max_age_in_seconds = 3600
  }
}

resource "azurerm_subnet" "example" {
  name                 = "mySubnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_storage_container" "example" {
  name                  = "mycontainer"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "example" {
  name                   = "exampleblob"
  storage_account_name   = azurerm_storage_account.example.name
  storage_container_name = azurerm_storage_container.example.name
  type                   = "Block"
  source                 = "path/to/local/file"  # Replace with path to your local file
  content_type           = "application/json"
  cache_control          = "max-age=3600"
  metadata = {
    custom_property = "value"
  }
}
