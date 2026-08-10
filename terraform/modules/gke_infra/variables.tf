# —— GCP ———————————————————————————————————————————————————————————————————————

variable "project" {
    type        = string
    description = "GCP Project ID"
    sensitive   = true
}


# —— Network variables —————————————————————————————————————————————————————————

variable "region" {
  type        = string
  description = "GCP Region where our VPC would be"
  default     = "us-west1"
}

variable "zone" {
  type        = string
  description = "GCP Zone where our VPC would be"
  default     = "us-west1-a"
}

variable "subnet_cidr" {
  type        = string
  description = "CIDR of the public subnet"
  default     = "10.0.0.0/16"
}


# —— GCP Variables —————————————————————————————————————————————————————————————

variable "cluster_name" {
  type        = string
  description = "GKE cluster name"
  default     = "gke-cluster"
}

variable "init_node_count" {
  type        = number
  description = "Amount of Nodes on initialization"
  default     = 1
}

variable "machine_type" {
  type        = string
  description = "Node VM type"
}