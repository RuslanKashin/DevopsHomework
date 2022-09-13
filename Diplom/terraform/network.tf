resource "yandex_vpc_address" "kashinip" {
  name = "${terraform.workspace}-ip"
  external_ipv4_address {
    zone_id = "ru-central1-a"
  }
}

resource "yandex_vpc_network" "network" {
  name = "${terraform.workspace}-net"
}

resource "yandex_vpc_subnet" "subnetwork1" {
  name           = "${terraform.workspace}-subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

resource "yandex_vpc_subnet" "subnetwork2" {
  name           = "${terraform.workspace}-subnet2"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = ["192.168.20.0/24"]
}

