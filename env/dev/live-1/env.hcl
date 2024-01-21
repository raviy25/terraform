locals {
    environment = "dev"
    region = "us-east-1"
#    nodepools = {
#    worker = {
#      name         = "worker"
#      node_labels  = { "worker-name" = "worker" }
#      machine_type = "n1-standard-1"
#      node_count   = 1
#    }
#  }
  k8s_pod_cidr = "10.1.0.0/17"
  k8s_service_cidr = "10.2.0.0/21"
  router_name = "${var.environment}-rt"
  cidrBlock = "10.3.0.0/16"
}
