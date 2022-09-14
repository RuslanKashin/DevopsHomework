# Nginx and LetsEncrypt
resource "yandex_compute_instance" "kashin" {
  name     = "${terraform.workspace}-kashin"
  hostname = "${var.domain_name}"

  resources {
    cores  = 2
    memory = 2
    core_fraction = local.workspace[terraform.workspace]
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = 10
    }
  }

  network_interface {
    subnet_id      = yandex_vpc_subnet.subnetwork1.id
    nat            = true
    nat_ip_address = yandex_vpc_address.kashinip.external_ipv4_address[0].address
  }

  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
  }
}


# MySQL

resource "yandex_compute_instance" "db01" {
  name     = "${terraform.workspace}-db01"
  hostname = "db01.${var.domain_name}"

  resources {
    cores  = 4
    memory = 4
    core_fraction = local.workspace[terraform.workspace]
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnetwork1.id
    nat       = false
  }

  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "db02" {
  name     = "${terraform.workspace}-db02"
  hostname = "db02.${var.domain_name}"

  resources {
    cores  = 4
    memory = 4
    core_fraction = local.workspace[terraform.workspace]
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnetwork1.id
    nat       = false
  }

  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
  }
}

#WordPress
resource "yandex_compute_instance" "app" {
  name     = "${terraform.workspace}-app"
  hostname = "app.${var.domain_name}"

  resources {
    cores  = 4
    memory = 4
    core_fraction = local.workspace[terraform.workspace]
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnetwork1.id
    nat       = false
  }

  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
  }
}

#Gitlab
resource "yandex_compute_instance" "gitlab" {
  name     = "${terraform.workspace}-gitlab"
  hostname = "gitlab.${var.domain_name}"

  resources {
    cores  = 4
    memory = 4
    core_fraction = local.workspace[terraform.workspace]
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnetwork1.id
    nat       = false
  }

  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
  }
}


#Gitlab runner
resource "yandex_compute_instance" "runner" {
  name     = "${terraform.workspace}-runner"
  hostname = "runner.${var.domain_name}"

  resources {
    cores  = 4
    memory = 4
    core_fraction = local.workspace[terraform.workspace]
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnetwork1.id
    nat       = false
  }

  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
  }
}

# Prometheus, Alert Manager, Node Exporter и Grafana
resource "yandex_compute_instance" "monitoring" {
  name     = "${terraform.workspace}-monitoring"
  hostname = "monitoring.${var.domain_name}"

  resources {
    cores  = 4
    memory = 4
    core_fraction = local.workspace[terraform.workspace]
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnetwork1.id
    nat       = false
  }

  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
  }
}



