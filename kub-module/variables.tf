variable "cluster_name" {
  description = "Nom du cluster Kubernetes"
  type        = string
}

variable "location" {
  description = "Localisation Azure"
  type        = string
}

variable "resource_group_name" {
  description = "Nom du groupe de ressources"
  type        = string
}

variable "dns_prefix" {
  description = "Préfixe DNS"
  type        = string
}

variable "node_count" {
  description = "Nombre de nœuds"
  type        = number
  default     = 2
}

variable "vm_size" {
  description = "Taille des machines virtuelles"
  type        = string
  default     = "Standard_B1ms"
}
