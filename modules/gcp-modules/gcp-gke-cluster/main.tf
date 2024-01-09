# invoking vpc and subnets modules
module "vpc_with_subnets" {
  # invoke vpc_and_subnets module under modules directory
  source = "../gcp-vpc"

  # create vpc and subnet with the same name as cluster name
  vpc_name    = var.cluster_name
  subnet_name = var.cluster_name

  # region where the resources need to be created
  region = var.region

  cidrBlock = var.cidrBlock
  k8s_service_cidr = var.k8s_service_cidr
  router_name = var.router_name
  k8s_pod_cidr = var.k8s_pod_cidr

}

# invoking gke module to create gke cluster and node group
module "gke_with_node_group" {
  # invoke gke module under modules directory
  source = "../gcp-gke"

  cluster_name = var.cluster_name
  k8s_version  = var.k8s_version
  region       = var.region
  nodepools    = var.nodepools
  network      = module.vpc_with_subnets.vpc_self_link
  subnetwork   = module.vpc_with_subnets.subnet_self_link
  environment = var.environment
}
