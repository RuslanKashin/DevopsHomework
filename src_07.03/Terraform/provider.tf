terraform {
  required_providers {
    yandex = {
      source = "terraform-registry.storage.yandexcloud.net/yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
  
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "kashinbucket"
    region     = "ru-central1"
    key        = "trf/terraform.tfstate"
    access_key = "YCAJE***"
    secret_key = "YCN56EN***"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

provider "yandex" {
  token = var.yc_token
  cloud_id  = var.yc_cloud_id
  folder_id = var.yc_folder_id
  zone = var.yc_zone
}
