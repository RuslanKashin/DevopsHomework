   resource "yandex_compute_instance" "netology" {
     name = "netology"
   
     resources {
       cores  = 2
       memory = 2
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
   
   output "internal_ip_address_netology_vm" {
     value = yandex_compute_instance.netology.network_interface.0.ip_address
   }
   
   output "external_ip_address_netology_vm" {
     value = yandex_compute_instance.netology.network_interface.0.nat_ip_address
   }

