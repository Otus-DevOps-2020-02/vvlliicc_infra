variable public_key_path {
  description = "Path to the public key used to connect to instance"
}

variable zone {
  description = "Zone"
 default = "europe-west4-a"

}

variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db-base-1588499247"
}

