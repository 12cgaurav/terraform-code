resource "azurerm_network_interface" "nic" {
    for_each = var.vm
  name                = each.value.nicname
  location            = each.value.location
  resource_group_name = each.value.rgname

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.example[each.key].id
    private_ip_address_allocation = "Dynamic"
    
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
    for_each =  var.vm
  name                = each.value.vmname
  resource_group_name = each.value.rgname
  location            = each.value.location
  size                = "Standard B1s"
  disable_password_authentication = false
  admin_username      = "adminuser"
  admin_password = "admin@123456"
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]

#   admin_ssh_key {
#     username   = "adminuser"
#     public_key = file("~/.ssh/id_rsa.pub")
#   }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}