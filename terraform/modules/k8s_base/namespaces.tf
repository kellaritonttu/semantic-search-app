# —— Namespaces ————————————————————————————————————————————————————————————————

resource "kubernetes_namespace" "app" {
  metadata {
    name = local.app_namespace
  }
}

resource "kubernetes_namespace" "argocd" {
  metadata {
    name = local.argo_namespace
  }
}