module "rg" {
  source = "../../Modules/RG"
  rg     = var.rg
}


module "vnet" {
  depends_on = [module.rg]
  source     = "../../Modules/VNET"
  vnet       = var.vnet
}


module "nic" {
  depends_on = [module.vnet]
  source     = "../../Modules/NIC"
  nic        = var.nic

}

module "pip" {
  depends_on = [module.rg]
  source     = "../../Modules/PIP"
  puip       = var.pip
}