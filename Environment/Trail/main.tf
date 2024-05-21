module "RG" {
  source = "../../Modules/RG"
  rg = var.rg
}

module "vnet" {
  source = "../../Modules/VNET"
  vnet = var.vnet
  depends_on = [ module.RG ]
}

module "subnet" {
  source = "../../Modules/SUBNET"
  snet= var.snet
  depends_on = [ module.vnet ]
}



