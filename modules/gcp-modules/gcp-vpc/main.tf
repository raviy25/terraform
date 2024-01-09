resource "google_project_service" "compute" {
  service = "compute.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "container" {
  service = "container.googleapis.com"
  disable_dependent_services = true
}

# VPC - https://registry.terraform.io/providers/hashicorp/google/5.10.0/docs/resources/compute_network
resource "google_compute_network" "vpc" {
  name        = var.vpc_name
  description = var.vpc_description

  # the network is created in "custom subnet mode"
  # we will explicitly connect subnetwork resources below using google_compute_subnetwork resource
  auto_create_subnetworks = "false"
  mtu                     = 1460
  routing_mode = "REGIONAL"
  delete_default_routes_on_create = false

  depends_on = [ google_project_service.compute, google_project_service.container ]
}

# Subnet - https://registry.terraform.io/providers/hashicorp/google/4.74.0/docs/resources/compute_subnetwork
resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  description   = var.subnet_description
  region        = var.region
  network       = google_compute_network.vpc.id
  private_ip_google_access = true
  ip_cidr_range = var.cidrBlock

  secondary_ip_range {
    range_name    = "k8s-pod-range"
    ip_cidr_range = var.k8s_pod_cidr
  }
  secondary_ip_range {
    range_name    = "k8s-service-range"
    ip_cidr_range = var.k8s_service_cidr
  }
}
