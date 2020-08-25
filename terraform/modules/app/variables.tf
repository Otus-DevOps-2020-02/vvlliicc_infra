variable public_key_path {
  description = "Path to the public key used to connect to instance"
}

variable zone {
  description = "Zone"
  # Значение по умолчанию
  default = "europe-west4-a"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = " reddit-app-base-1588498992"
}
