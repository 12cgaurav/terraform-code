rg = {
  rg1 = {
    rgname   = "rg-Hub1"
    location = "centralindia"
  }

}

vnet = {
  vnet1 = {
    vname    = "vnet-Hub1"
    location = "centralindia"
    rgname   = "rg-Hub1"
    adspace  = ["10.0.0.0/16"]
  #   subnets = {
  # snet1 = {
  #   sname            = "AzureBastionSubnet"

  #   address_prefixes = "10.0.0.0/24"

  # }
  # snet2 = {
  #   sname            = "linux-hub"

  #   address_prefixes = "10.0.1.0/24"

  # }
  #   }

  }

}


# nic = {

#     nic1 = {
#         nicname = "nic-1"
#         rgname = "rg-Hub1"
#         location = "centralindia"
#         sname = "linux-hub"
#         vname = "vnet-Hub1"
#         pipname = "pip-1"
#     }
#     nic2 = {
#         nicname = "nic-2"
#         rgname = "rg-Hub1"
#         location = "centralindia"
#         sname = "linux-hub"
#         vname = "vnet-Hub1"
#         pipname = ""
#     }
# }


# pip = {
#     pip1 = {
#         pipname = "pip-1"
#         rgname = "rg-Hub1"
#         location = "centralindia"
#     }
# }

snet = {
  snet1={
    sname ="snet1"
    vname = "vnet-Hub1"
    rgname = "rg-Hub1"
    address_prefixes = ["10.0.0.0/24"]
  }
}