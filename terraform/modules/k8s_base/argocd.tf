# —— ArgoCD ————————————————————————————————————————————————————————————————————

resource "helm_release" "argocd" {
    name             = "argocd"
    
    repository       = "https://argoproj.github.io/argo-helm"
    chart            = "argo-cd"
    namespace        = kubernetes_namespace.argocd.metadata[0].name
    create_namespace = false
    version          = "3.35.4"

    values = [file("${path.module}/values/argocd.yaml")]

    depends_on = [ kubernetes_namespace.argocd ]
}

resource "local_file" "argocd_app" {
  content = templatefile("${path.module}/templates/argocd-app.yaml", {
    app_name         = var.app_name
    argocd_namespace = kubernetes_namespace.argocd.metadata[0].name
    repo_url         = var.repo_url
    helm_path        = var.helm_path
    revision         = var.revision
    load_balancer_ip = var.load_balancer_ip
    app_namespace    = var.app_namespace
  })
  filename = "${path.module}/rendered/argocd-app.yaml"
}