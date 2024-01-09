locals {
  k8s_pod_cidr = "10.1.0.0/17"
  k8s_service_cidr = "10.2.0.0/21"
  router_name = "${var.environment}-rt"
  cidrBlock = "10.3.0.0/16"
}

# invoke cluster module which creates vpc, subnet and gke cluter with a default worker nodepool
module "cluster" {
  source = "../../modules/gcp-modules/gcp-gke-cluster"

  region       = var.region
  cluster_name = "${var.environment}-gke-cluster"
  k8s_version  = var.k8s_version
  environment = var.environment
  k8s_pod_cidr = local.k8s_pod_cidr
  k8s_service_cidr = local.k8s_service_cidr
  router_name = local.router_name
  cidrBlock = local.cidrBlock
}
