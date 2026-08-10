module "k8s_base" {
  source = "../modules/k8s_base"

  app_namespace = "semantic-search"

  postgres_db       = var.postgres_db
  postgres_user     = var.postgres_user
  postgres_password = var.postgres_password
  secret_key        = var.secret_key
  OWNER_PASSWORD    = var.OWNER_PASSWORD
  OWNER_USERNAME    = var.OWNER_USERNAME

  load_balancer_ip = ""
}


resource "null_resource" "argocd_app" {
  provisioner "local-exec" {
    command = "kubectl apply -f ${path.module}/../modules/rendered/argocd-app.yaml"
  }

  depends_on = [ module.k8s_base ]
}