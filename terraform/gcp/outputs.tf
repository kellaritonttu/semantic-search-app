output "app_load_balancer_ip" {
  description = "The public Load Balancer IP of the App Helm chart"
  value       = module.gke.public_ip
}