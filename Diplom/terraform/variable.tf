variable "yc_zone" {
  type    = string
  default = "ru-central1-a"
}

variable "yc_cloud_id" {
  type    = string
  default = "b1g8iii5fc0rhcs2hhva"
}

variable "yc_folder_id" {
  type    = string
  default = "b1g0oq3l0v2i5d06afl2"
}

variable "domain_name" {
  type    = string
  default = "kashin.store"
}

# Взял самый актуальный образ Ubuntu 20.04 из списка полученного командой "yc compute image list --folder-id standard-images"
variable "image_id" {
  default = "fd8kdq6d0p8sij7h5qe3"
}