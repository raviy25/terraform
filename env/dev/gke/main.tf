# invoke cluster module which creates vpc, subnet and gke cluter with a default worker nodepool
module "cluster" {
  source = "../../../modules/gcp-modules/gcp-gke-cluster"

  region       = var.region
  cluster_name = var.cluster_name
  k8s_version  = var.k8s_version
}
