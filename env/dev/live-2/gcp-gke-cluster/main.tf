locals {
  k8s_pod_cidr = "10.1.0.0/17"
  k8s_service_cidr = "10.2.0.0/21"
  router_name = "${var.environment}-rt"
  cidrBlock = "10.3.0.0/16"
}

# invoking vpc and subnets modules
module "vpc_with_subnets" {
  # invoke vpc_and_subnets module under modules directory
  source = "../../../../modules/gcp-modules/gcp-vpc"

  # create vpc and subnet with the same name as cluster name
  vpc_name    = var.cluster_name
  subnet_name = var.cluster_name

  # region where the resources need to be created
  region = var.region

  cidrBlock = local.cidrBlock
  k8s_service_cidr = local.k8s_service_cidr
  router_name = local.router_name
  k8s_pod_cidr = local.k8s_pod_cidr

}

# invoking gke module to create gke cluster and node group
module "gke_with_node_group" {
  # invoke gke module under modules directory
  source = "../../../../modules/gcp-modules/gcp-gke"

  cluster_name = var.cluster_name
  k8s_version  = var.k8s_version
  region       = var.region
  nodepools    = var.nodepools
  network      = module.vpc_with_subnets.vpc_self_link
  subnetwork   = module.vpc_with_subnets.subnet_self_link
  environment = var.environment
  depends_on = [module.vpc_with_subnets]
}
