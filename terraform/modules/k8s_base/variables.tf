# —— Namespaces ————————————————————————————————————————————————————————————————

variable "app_namespace" {
  type        = string
  description = "Namespace for Helm Chart deployment"
  default     = "default"
}

variable "argo_namespace" {
  type        = string
  description = "Namespace for ArgoCD"
  default     = "default"
}


# —— App ———————————————————————————————————————————————————————————————————————

variable "postgres_db" {
  description = "PostgreSQL database name"
  default     = "project_db"
}

variable "postgres_user" {
  description = "PostgreSQL user"
  default     = "admin"
}

variable "postgres_password" {
  description = "PostgreSQL password"
  sensitive   = true
}

variable "secret_key" {
  description = "Secret Key for AUTH"
  sensitive   = true
}

variable "OWNER_PASSWORD" {
  description = "Owner user password"
  sensitive   = true
}

variable "OWNER_USERNAME" {
  description = "Owner user username"
  sensitive   = true
}


# —— loadBalancerIP ———————————————————————————————————————————————————————————————————————

variable "load_balancer_ip" {
  description = "Static public IP for gateway LoadBalancer"
  type        = string
  default     = ""
}


# —— ArgoCD ———————————————————————————————————————————————————————————————————————

variable "repo_url" {
  description = "GitHub repo URL for ArgoCD to watch"
  type        = string
  default     = "https://github.com/kellaritonttu/semantic-search-app.git"
}

variable "revision" {
  description = "Branch or tag for ArgoCD to track"
  type        = string
  default     = "develop"
}

variable "app_name" {
  description = "ArgoCD application name"
  type        = string
  default     = "semantic-search"
}

variable "helm_path" {
  description = "Path to Helm chart in the repo"
  type        = string
  default     = "helm"
}