module "RG" {
  source = "../../Modules/RG"
  rg = var.rg
}

module "vnet" {
  source = "../../Modules/VNET"
  vnet = var.vnet
  depends_on = [ module.RG ]
}

module "nsg" {
  source = "../../Modules/NSG"
  nsg = var.nsg
  depends_on = [ module.vnet ]
}

module "bastion" {
  source = "../../Modules/BASTION"
  bastion = var.bastion
  depends_on = [ module.vpeer ]
}

module "vpeer" {
  source = "../../Modules/VPEERING"
  vpeer = var.vpeer
  depends_on = [ module.vnet ]
}

module "vm" {
  depends_on = [ module.vpeer ]
  source = "../../Modules/VM"
  vm = var.vm
}

module "winvm" {

  depends_on = [ module.vpeer]
  source = "../../Modules/VM-window"
  winvm = var.winvm
  
}