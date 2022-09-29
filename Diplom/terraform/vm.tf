resource "yandex_compute_instance" "node01nginx" {
  name                      = "vm01nginx"
  zone                      = "ru-central1-b"
  hostname                  = "${var.my_domain}"
  platform_id               = "standard-v2"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 2
    core_fraction = local.performance[terraform.workspace]
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.ubuntu-nat}"
      name        = "root-node01nginx"
      type        = "network-nvme"
      size        = "10"
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.pub-subnet.id}"
    nat       = true
    ip_address = "192.168.100.11"
    nat_ip_address = yandex_vpc_address.ip.external_ipv4_address[0].address
  }

  metadata = {
#    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
    user-data = "${file("user.txt")}"
  }

}


resource "yandex_compute_instance" "node02db01" {
  name                      = "vm02db01"
  zone                      = "ru-central1-a"
  hostname                  = "db01.${var.my_domain}"
  platform_id               = "standard-v2"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
    core_fraction = local.performance[terraform.workspace]
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.ubuntu-latest}"
      name        = "root-node02db01"
      type        = "network-nvme"
      size        = "10"
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.priv-subnet.id}"
#    nat       = true
    ip_address = "192.168.101.12"
  }

  metadata = {
#    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
    user-data = "${file("user.txt")}"
  }
}

resource "yandex_compute_instance" "node03db02" {
  name                      = "vm03db02"
  zone                      = "ru-central1-a"
  hostname                  = "db02.${var.my_domain}"
  platform_id               = "standard-v2"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
    core_fraction = local.performance[terraform.workspace]
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.ubuntu-latest}"
      name        = "root-node03db02"
      type        = "network-nvme"
      size        = "10"
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.priv-subnet.id}"
#    nat       = true
    ip_address = "192.168.101.13"
  }

  metadata = {
#    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
    user-data = "${file("user.txt")}"
  }
}


resource "yandex_compute_instance" "node04app" {
  name                      = "vm04app"
  zone                      = "ru-central1-a"
  hostname                  = "app.${var.my_domain}"
  platform_id               = "standard-v2"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
    core_fraction = local.performance[terraform.workspace]
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.ubuntu-latest}"
      name        = "root-node04app"
      type        = "network-nvme"
      size        = "10"
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.priv-subnet.id}"
#    nat       = true
    ip_address = "192.168.101.14"
  }

  metadata = {
#    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
    user-data = "${file("user.txt")}"
  }
}


resource "yandex_compute_instance" "node05gitlab" {
  name                      = "vm05gitlab"
  zone                      = "ru-central1-a"
  hostname                  = "gitlab.${var.my_domain}"
  platform_id               = "standard-v2"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 8
    core_fraction = local.performance[terraform.workspace]
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.ubuntu-latest}"
      name        = "root-node05gitlab"
      type        = "network-nvme"
      size        = "10"
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.priv-subnet.id}"
#    nat       = true
    ip_address = "192.168.101.15"
  }

  metadata = {
#    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
    user-data = "${file("user.txt")}"
  }
}

resource "yandex_compute_instance" "node06runner" {
  name                      = "vm06runner"
  zone                      = "ru-central1-a"
  hostname                  = "runner.${var.my_domain}"
  platform_id               = "standard-v2"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
    core_fraction = local.performance[terraform.workspace]
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.ubuntu-latest}"
      name        = "root-node06runner"
      type        = "network-nvme"
      size        = "10"
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.priv-subnet.id}"
#    nat       = true
    ip_address = "192.168.101.16"
  }

  metadata = {
#    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
    user-data = "${file("user.txt")}"
  }
}

resource "yandex_compute_instance" "node07monitoring" {
  name                      = "vm07monitoring"
  zone                      = "ru-central1-a"
  hostname                  = "monitoring.${var.my_domain}"
  platform_id               = "standard-v2"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
    core_fraction = local.performance[terraform.workspace]
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.ubuntu-latest}"
      name        = "root-node07monitoring"
      type        = "network-nvme"
      size        = "10"
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.priv-subnet.id}"
#    nat       = true
    ip_address = "192.168.101.17"
  }

  metadata = {
#    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
    user-data = "${file("user.txt")}"
  }
}


