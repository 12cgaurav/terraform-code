rg = {
  rgtester1 = {
    rgname   = "rgtester1"
    location = "centralindia"
  }
}

vnet = {
  vnet1 = {
    vname    = "vnet1"
    location = "centralindia"
    rgname   = "rgtester1"
    adspace  = ["10.0.0.0/16"]
    "subnets" = {
      snet1 = {
        snetname         = "snet1"
         address_prefixes = "10.0.0.0/24"
      }
     }
  }

  vnet2 = {
    vname    = "vnet2"
    location = "centralindia"
    rgname   = "rgtester1"
    adspace  = ["10.1.0.0/16"]
    "subnets" = {
        snet2 = {
        snetname         = "snet2"
         address_prefixes = "10.1.0.0/24"
      }
    }
  }

}

nic = {
  nic1 = {
    nicname  = "nic1"
    location = "centralindia"
    rgname   = "rgtester1"
    sname    = "snet1"
    vname    = "vnet1"
    Attach_public_ip = true
    pipname  = "pip1"
  }

  nic2 = {
    nicname  = "nic2"
    location = "centralindia"
    rgname   = "rgtester1"
    sname    = "snet2"
    vname    = "vnet2"
    Attach_public_ip = true
}
}


pip = {
  pip1 = {
    pipname  = "pip1"
    rgname   = "rgtester1"
    location = "centralindia"
    
  }
}