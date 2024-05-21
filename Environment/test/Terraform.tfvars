rgnm = {
  rg1 = {
    rgname   = "rg-test"
    location = "centralindia"
  }
}

vnetname = {
  "vnet1" = {
    vname    = "vnet-test22"
    location = "centralindia"
    rgname   = "rg-test"
    adspace  = ["10.0.0.0/16"]

  }
}

snetname = {
  snet1 = {
    sname            = "AzureBastionSubnet"
    rgname           = "rg-test"
    vname            = "vnet-test22"
    address_prefixes = ["10.0.0.0/24"]

  }
  snet2 = {
    sname            = "snet-test2"
    rgname           = "rg-test"
    vname            = "vnet-test22"
    address_prefixes = ["10.0.1.0/24"]

  }
snet3 = {
    sname            = "snet-test3"
    rgname           = "rg-test"
    vname            = "vnet-test22"
    address_prefixes = ["10.0.2.0/24"]

  }
}

nicm = {
  nic1 = {
    nicname  = "nic-test1"
    location = "centralindia"
    rgname   = "rg-test"
    sname    = "snet-test2"
    vname    = "vnet-test22"
  }
  nic2 = {
    nicname  = "nic-test2"
    location = "centralindia"
    rgname   = "rg-test"
    sname    = "snet-test3"
    vname    = "vnet-test22"
  }
}


pip = {
  pip1 = {
    pipname  = "pip-test1"
    location = "centralindia"
    rgname   = "rg-test"
  }

}

vmm = {
  vm1 = {
    vmname   = "vm-test1"
    location = "centralindia"
    rgname   = "rg-test"
    nicname  = "nic-test1"
  }

   vm2 = {
    vmname   = "vm-test2"
    location = "centralindia"
    rgname   = "rg-test"
    nicname  = "nic-test2"
  }
}


bastiontest = {
  bastion1 = {
    bastionname = "bastion-test1"
    location    = "centralindia"
    rgname      = "rg-test"
    sname       = "AzureBastionSubnet"
    vname       = "vnet-test22"
    pipname     = "pip-test1"


  }
}


lb = {
  
}