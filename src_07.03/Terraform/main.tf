resource "yandex_compute_instance" "netology-count" {
     
    count = local.instance_count[terraform.workspace]
    name = "${terraform.workspace}-netology-count-${count.index}"

    resources {
       cores  = local.vm_cores[terraform.workspace]
       memory = local.vm_memory[terraform.workspace]
    }
	     
    boot_disk {
      initialize_params {
         image_id = "fd81n37q9kgufk6rb4c0"
       }
    }
   
    network_interface {
       subnet_id = yandex_vpc_subnet.my-subnet.id
       nat       = true
    }
   
    metadata = {
       ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
    }

    lifecycle {
       create_before_destroy = true
    }

}

resource "yandex_compute_instance" "netology-foreach" {
     
    for_each = local.vm_foreach[terraform.workspace]
    name = "${terraform.workspace}-netology-foreach-${each.key}"

    resources {
       cores  = each.value.cores
       memory = each.value.memory
    }

    boot_disk {
      initialize_params {
         image_id = "fd81n37q9kgufk6rb4c0"
       }
    }
   
    network_interface {
       subnet_id = yandex_vpc_subnet.my-subnet.id
       nat       = true
    }
   
    metadata = {
       ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
    }
    
    lifecycle {
       create_before_destroy = true
    }
} 


   
   resource "yandex_vpc_network" "my-network" {
     name = "my-network"
   }
   
   resource "yandex_vpc_subnet" "my-subnet" {
     name           = "my-subnet"
     zone           = var.yc_zone
     network_id     = yandex_vpc_network.my-network.id
     v4_cidr_blocks = ["192.168.10.0/24"]
   }
   
locals {
  instance_count = {
    "stage"=1
    "prod"=2
  }
  vm_cores = {
    "stage"=1
    "prod"=2
  }
  vm_memory = {
    "stage"=1
    "prod"=2
  }
  vm_foreach = {
    stage = {
      "1" = { cores = "1", memory = "1" }
    }
    prod = {
      "3" = { cores = "2", memory = "2" },
      "2" = { cores = "2", memory = "2" }
    }
  }
}   
   
