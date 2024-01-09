# to use s3 backend
# s3 bucket is configured at command line
terraform {
  backend "gcs" {
    bucket = "cosnix-tf-dev"
  }
}
