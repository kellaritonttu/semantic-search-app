module "gke" {
  source = "../modules/gke_infra"

  project         = var.project
  region          = var.region
  zone            = var.zone
  cluster_name    = var.cluster_name
  subnet_cidr     = var.subnet_cidr
  machine_type    = var.machine_type
  init_node_count = var.init_node_count
}

module "k8s_base" {
  source = "../modules/k8s_base"

  app_namespace = "semantic-search"

  postgres_db       = var.postgres_db
  postgres_user     = var.postgres_user
  postgres_password = var.postgres_password
  secret_key        = var.secret_key
  OWNER_PASSWORD    = var.OWNER_PASSWORD
  OWNER_USERNAME    = var.OWNER_USERNAME

  load_balancer_ip  = module.gke.public_ip

  depends_on = [ module.gke ]
}


resource "null_resource" "argocd_app" {
  provisioner "local-exec" {
    command = "gcloud container clusters get-credentials ${var.cluster_name} --zone ${var.zone} --project ${var.project} && kubectl apply -f ${path.module}/../modules/k8s_base/rendered/argocd-app.yaml --validate=false"
  }

  depends_on = [module.k8s_base]
}