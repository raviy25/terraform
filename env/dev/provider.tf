# setup google provider
# the environment variables below will be set before invoking the module
# GOOGLE_CREDENTIALS - path/to/service/account/credentials/file
# GOOGLE_PROJECT - google project id where the resources need to be created
provider "google" {
  project = var.project
  region = var.region
#  credentials = "${file("/Users/ravindranathyadav/Downloads/dev-project-409209-3edbe624b393.json")}"
  credentials = "/Users/ravindranathyadav/Downloads/dev-project-409209-3edbe624b393.json"
  default_labels = {
    managed_by = "terraform"
    environment = "dev"
  }
}
