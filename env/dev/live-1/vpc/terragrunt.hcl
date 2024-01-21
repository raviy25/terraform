terraform {
  source = "../../../modules/gcp-modules/gcp-vpc"
}

include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path = find_in_parent_folders("env.hcl")
}

inputs = {
  vpc_name = "${include.env.locals.environment}-gke-vpc"
  vpc_description = "Dev vpc"
  subnet_name = "${include.env.locals.environment}-gke-vpc"
  subnet_description = "Dev vpc subnet"
  cidrBlock = include.env.locals.cidrBlock
  region = include.env.locals.region
  k8s_pod_cidr = include.env.locals.k8s_pod_cidr
  k8s_service_cidr = include.env.locals.k8s_service_cidr
  router_name = include.env.locals.router_name
}
