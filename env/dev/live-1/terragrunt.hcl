remote_state {
  backend = "gcs"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }

  config = {
    skip_bucket_creation = true
    bucket = "cosnix-tf-dev"
    prefix = "${path_relative_to_include()}/terraform.tfstate"
    credentials = "/Users/ravindranathyadav/Downloads/dev-project-409209-3edbe624b393.json"
    location = "us-east-1"
    project = "dev-project-409209"
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"

  contents = <<EOF
provider "google" {
    region = "us-east-1"
    project = "dev-project-409209"
    default_labels = {
      managed_by = "terraform"
      environment = "dev"
  }
}
EOF
}
