provider "google" {
  version = "~> 0.12.19"
  project = var.project
  region  = var.region
}

module "storage-bucket" {
  source  = "SweetOps/storage-bucket/google"
  version = "0.3.0"

  # Имя поменяйте на другое
  name = "storage-test"
}

output storage-bucket_url {
  value = module.storage-bucket.url
}
