provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "hamsak-terraform-aks-rg"
  location = "East US"
}

module "cluster1" {
  source              = "./kub-module"
  cluster_name        = "hamsak-aks-cluster1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "cluster1"
  node_count          = 2
  vm_size             = "Standard_B1ms"
}

module "cluster2" {
  source              = "./kub-module"
  cluster_name        = "hamsak-aks-cluster2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "cluster2"
  node_count          = 2
  vm_size             = "Standard_B1ms"
}