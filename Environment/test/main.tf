module "RG" {
  source = "../../Modules/RG"
  rg     = var.rgnm
}

module "vnet" {
  depends_on = [module.RG]
  source     = "../../Modules/VNET"
  vnet       = var.vnetname
}

module "snet" {
  depends_on = [module.vnet]
  source     = "../../Modules/SUBNET"
  snet       = var.snetname

}

module "nicname" {
  depends_on = [module.snet]
  source     = "../../Modules/NIC"
  nic        = var.nicm
}

module "PUIP" {
  depends_on = [module.RG]
  source     = "../../Modules/PIP"
  puip       = var.pip
}


module "vmkamodule" {
  depends_on = [module.nicname]
  source     = "../../Modules/VM"
  vm         = var.vmm

}
module "bastion" {
  depends_on = [module.snet]
  source     = "../../Modules/BASTION"
  bastion    = var.bastiontest

}

module "loadbalancer"" {
  source = "../../Modules/LB"
  lbs = var.lb
}