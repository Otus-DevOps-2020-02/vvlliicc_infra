terraform {
  # Версия terraform
  required_version = "~> 0.12.19"
}

provider "google" {
  credentials = file("/home/viktor/Downloads/Infra-39d53002ed4b.json")
  # Версия провайдера
  version = "2.15"
  # ID проекта
  project = var.project
  region  = var.zone
}
module "app" {
  source          = "../modules/app"
  public_key_path = var.public_key_path
  app_disk_image  = var.app_disk_image
}

module "db" {
  source          = "../modules/db"
  public_key_path = var.public_key_path
  db_disk_image   = var.db_disk_image
}

module "vpc" {
  source        = "../modules/vpc"
  source_ranges = ["0.0.0.0/0"]
}

