rg = {
  rg1 = {
    rgname   = "rg-Hub1"
    location = "centralindia"
  }
  rg2 = {
    rgname   = "rg-spoke1"
    location = "eastus"
  }
 rg3 = {
    rgname   = "rg-spoke2"
    location = "eastus2"
  }
}

vnet = {
  "vnet1" = {
    vname    = "vnet-Hub1"
    location = "centralindia"
    rgname   = "rg-Hub1"
    adspace  = ["10.0.0.0/16"]
    subnets = {
  snet1 = {
    sname            = "AzureBastionSubnet"

    address_prefixes = "10.0.0.0/24"

  }
  snet2 = {
    sname            = "linux-hub"

    address_prefixes = "10.0.1.0/24"

  }

  
  }
  }

  "vnet2" = {
    vname    = "vnet-spoke1"
    location = "eastus"
    rgname   = "rg-spoke1"
    adspace  = ["10.1.0.0/16"]
    subnets = {
      snet1 = {
    sname            = "win-spoke1"
    rgname           = "rg-spoke1"
    vname            = "vnet-spoke1"
    address_prefixes = "10.1.0.0/24"

  }
  snet2 = {
    sname            = "linux-spoke1"
    rgname           = "rg-spoke1"
    vname            = "vnet-spoke1"
    address_prefixes = "10.1.1.0/24"
}
}
}

"vnet3" = {
    vname    = "vnet-spoke2"
    location = "eastus2"
    rgname   = "rg-spoke2"
    adspace  = ["10.2.0.0/16"]
    subnets = {
      snet1 = {
    sname            = "win-spoke2"
    rgname           = "rg-spoke2"
    vname            = "vnet-spoke2"
    address_prefixes = "10.2.0.0/24"

  }
  snet2 = {
    sname            = "linux-spoke2"
    rgname           = "rg-spoke2"
    vname            = "vnet-spoke2"
    address_prefixes = "10.2.1.0/24"
}
}
}
}

nsg = {
#   nsg1 = {
#     nsgname  = "nsg-1"
#     location = "centralindia"
#     rgname   = "rg-Hub1"
#     sname    = "AzureBastionSubnet"
#     vname    = "vnet-Hub1"
#         srule = {
#      srule1 = {
#     name                       = "srule1"
#     priority                   = 100
#     direction                  = "Inbound"
#     access                     = "Allow"
#     source_port_range          = "3389"
#     destination_port_range     = "3389"
#     protocol                   = "Tcp"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"

#   }

# srule2 = {
#     name                       = "srule2"
#     priority                   = 200
#     direction                  = "Inbound"
#     access                     = "Allow"
#     source_port_range          = "22"
#     destination_port_range     = "22"
#     protocol                   = "Tcp"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }
#   }
#   }
  nsg2 = {
    nsgname  = "nsg-2"
    location = "eastus"
    rgname   = "rg-spoke1"
    sname    = "win-spoke1"
    vname    = "vnet-spoke1"
    srule = {
     srule1 = {
    name                       = "srule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    source_port_range          = "*"
    destination_port_range     = "3389"
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    destination_address_prefix = "*"

  }
  }
  }
nsg3 = {
    nsgname  = "nsg-3"
    location = "eastus"
    rgname   = "rg-spoke1"
    sname    = "linux-spoke1"
    vname    = "vnet-spoke1"
    srule = {
     srule1 = {
    name                       = "srule1"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    source_port_range          = "*"
    destination_port_range     = "*"
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    destination_address_prefix = "*"

  }
  }
  

}
nsg4 = {
    nsgname  = "nsg-4"
    location = "eastus2"
    rgname   = "rg-spoke2"
    sname    = "win-spoke2"
    vname    = "vnet-spoke2"
    srule = {
     srule1 = {
    name                       = "srule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    source_port_range          = "*"
    destination_port_range     = "3389"
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    destination_address_prefix = "*"

  }
  }
}
nsg5 = {
    nsgname  = "nsg-5"
    location = "eastus2"
    rgname   = "rg-spoke2"
    sname    = "linux-spoke2"
    vname    = "vnet-spoke2"
    srule = {
     srule1 = {
    name                       = "srule1"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    source_port_range          = "*"
    destination_port_range     = "*"
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    destination_address_prefix = "*"

  }
  }
  }
  }

  bastion = {
    bastion1 = {
      pipname = "pip-1"
      location = "centralindia"
      rgname = "rg-Hub1"
      bastionname = "bastion-1"
      sname = "AzureBastionSubnet"
      vname = "vnet-Hub1"

    }
  }

  vpeer = {
    vpeer-1 = {
      name = "vpeer-1"
      rgname = "rg-Hub1"
      vname = "vnet-Hub1"
      rvname = "vnet-spoke1"
      rvrgname = "rg-spoke1"
    }
    vpeer-2 = {
      name = "vpeer-2"
      rgname = "rg-Hub1"
      vname = "vnet-Hub1"
      rvname = "vnet-spoke2"
      rvrgname = "rg-spoke2"
    }

      }

vm = {
  vm1 = {
    nicname= "Linux-nic-spoke1"
    location = "eastus"
    rgname = "rg-spoke1"
    vname = "vnet-spoke1"
    sname = "linux-spoke1"
    vmname = "Linux-vm-spoke1"
    publisher = "OpenLogic"
    offer = "CentOS"
    sku = "8_5-gen2"
    version = "latest"
  }

 vm2 = {
    nicname= "Linux-nic-spoke2"
    location = "eastus2"
    rgname = "rg-spoke2"
    vname = "vnet-spoke2"
    sname = "linux-spoke2"
    vmname = "Linux-vm-spoke2"
    publisher = "OpenLogic"
    offer = "CentOS"
    sku = "8_5-gen2"
    version = "latest"
  }
vm3 = {
    nicname= "Linux-nic-hub"
    location = "centralindia"
    rgname = "rg-hub"
    vname = "vnet-hub"
    sname = "linux-hub"
    vmname = "Linux-vm-hub"
    publisher = "OpenLogic"
    offer = "CentOS"
    sku = "8_5-gen2"
    version = "latest"
  }

}



winvm = {
  winvm1 = {
    nicname= "win-nic-spoke1"
    location = "eastus"
    rgname = "rg-spoke1"
    vname = "vnet-spoke1"
    sname = "win-spoke1"
    vmname = "win-vm-spoke1"
    publisher = "MicrosoftWindowsServer"
    offer = "WindowsServer"
    sku = "2022-datacenter-g2"
    version = "latest"
  }
winvm2 = {
    nicname= "win-nic-spoke2"
    location = "eastus2"
    rgname = "rg-spoke2"
    vname = "vnet-spoke2"
    sname = "win-spoke2"
    vmname = "win-vm-spoke2"
    publisher = "MicrosoftWindowsServer"
    offer = "WindowsServer"
    sku = "2022-datacenter-g2"
    version = "latest"
}
}


