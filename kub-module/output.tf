output "cluster_name" {
  description = "Nom du cluster Kubernetes"
  value = azurerm_kubernetes_cluster.aks_cluster.name
}

output "cluster_id" {
  description = "ID du cluster Kubernetes"
  value = azurerm_kubernetes_cluster.aks_cluster.id
}