variable "gcp_cred" {
  type = any
  default = {
  "type": "service_account",
  "project_id": "dev-project-409209",
  "private_key_id": "3edbe624b393220b61c4b70a32b912c60265c0ed",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEuwIBADANBgkqhkiG9w0BAQEFAASCBKUwggShAgEAAoIBAQCXuW7+IycNOD77\nuUAcUtnnP34jRAOEu/2Qyx97Yzsoy3UVpdvRt1ah6m1bqkvPC6cQC35Jib2ts5+3\nUXahwarOAgc0s0P6hwRWLYiBetuxpKPD1Gs+I/zI7WRKoyxT+PJ42QfhuGWiiaIm\nLUVHVMIXAn0NAi3QfjIqED/Mq7oVQvI6XV2mRq652M0YMISeq8s00zARLmJFg5Rv\nZ9GQMMWoyuGSG5Hn351NcjohmvlyMNHFLHOy63bhprCJYR0aByijE6AwgXBjWqIC\nzrXgdMxUCul2TxvDKVaceb5uhXF9M5/6JXlogOTUfkPwd75LlQZLKShpP128QgPP\n00IxVfN5AgMBAAECgf9nBljX41whHeWmsvlVl5dfRJM3tHdZ1PfZL2mxNIXMrbBT\ngsxBG2fi38xiR2uIATbv2N4Su/U7KJLLaAWmJluqh2CykwfAlkMw7A+ahvz8eKS7\nKleoBR0hUrvx8oWnKjl7gI5ZjLIhgakZQ07yS3DVLwYQTz/M0zmSVnZRWZ/XJGf/\nZckGaWBCYQPLnAQjdKnQb6EQPsP8a5rs3T4/lWhYKqfjo0kJVxmcskAasHswUItL\nujL2HKr5AM4XyA+dEtYkCXHCXwXq4579Csk7Va8EQ2uAhH4xjn5WpKeQai4ZQfFW\nZUgrX7FV9iKaG9uL1NimXYl/19BK4gr9cYlWDckCgYEAx65zxyzQKh9CCBCpSrXa\nYENwI44zGH+EzDAimbHpcGoPbQl23gWpJwNhgFONWtCgg48op0LxukLyDLjNVpDG\nVN0CRl28IB0OYOhJQdcZniLVPt4dcuTPWvXP96oMWJiGiFyPboQsjDw3u0wrWYbu\nT0uEz4ZLiHWzD/3DXmsljRUCgYEAwoRY2VmCsMchSc3pMPQmY21vpmgq6TfakT/O\na33T/Txp94UFJr2zrw640DBR+SJ6XQVDIZMbawHb/j4qAdfX2ZgcRUK4YUasKrPu\nGY326unc6IwDhfMkM0a87nhIYoHacFOzEyQpWcJD4Gr+5GrI/XgW8MVuGFQDiT0Y\nr9GXjdUCgYBksstcVHMd6umH268kKBVammfA5oNKBXTY7CVm0NvifvoMiMtTKBOn\nwwK2jmwosjFgZx+fShlRT1V1qPSUhSofvdzZ04d9wmlv4XSgKXOX1gUoUScUu+L+\nAhzAzxauzyx5NAR5PVqh1fRdFgp+eZdQkcsGRLlutbx5ggW2Zd5oCQKBgQCu78/o\nSXQcADqT4bfi6vDLYtSS2AQfkrfjAXtneNZ6XScAEIW9fcZnndngglR2tudNWToy\nq9Zwuk9brBSja7cYXpCuSX8BHUohbYipOt/iDUk7axCQG0dnRisMXOjcjuQhOWVH\nxbHao7ff0NpEGzV/n80h5K1K++PiPSxCk0C1sQKBgF/xmzIM7B9gWgVlC8tWiJWU\n8lJsT0s4ttFcz+u1ji/b6tA50PT1+D97rMPhucQb4/rUHAf1URANunEIt+gOrK/e\nX3iBf5wI2clq9Dzh7d9YFC8GdKgHcqxZouHf//lxNjdoiwlacX1mZquyPI1EyzwW\n7zKjqOw7uGj/1CQKs+XG\n-----END PRIVATE KEY-----\n",
  "client_email": "terraform@dev-project-409209.iam.gserviceaccount.com",
  "client_id": "101196770031691982086",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/terraform%40dev-project-409209.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
}
 
variable "cluster_name" {
  type        = string
  description = "vpc, subnet and gke cluster name"
}

variable "k8s_version" {
  type        = string
  description = "kubernetes version"
  default     = "1.27"
}

variable "region" {
  type        = string
  description = "gcp region where the gke cluster must be created, this region should match where you have created the vpc and subnet"
}

variable "cidrBlock" {
  type        = string
  description = "The cidr block for subnet"
  default     = "10.1.0.0/16"
}

variable "nodepools" {
  description = "Nodepools for the Kubernetes cluster"
  type = map(object({
    name         = string
    node_count   = number
    node_labels  = map(any)
    machine_type = string
  }))
  default = {
    worker = {
      name         = "worker"
      node_labels  = { "worker-name" = "worker" }
      machine_type = "e2-small"
      node_count   = 1
    }
  }
}

variable "environment" {
  type = string
  default = "dev"
}

variable "k8s_service_cidr" {
  type = string
  default = ""
}

variable "router_name" {
 type = string
 default = ""
}

variable "k8s_pod_cidr" {
  type = string
  default = ""
}

variable "project" {}
