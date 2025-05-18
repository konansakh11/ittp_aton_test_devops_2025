terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone = "ru-central1-a"
}

resource "yandex_vpc_network" "vm-network" {
  name = "vm-network"
}

resource "yandex_vpc_subnet" "vm-subnet" {
  name = "vm-subnet"
  zone = "ru-central1-a"
  network_id = yandex_vpc_network.vm-network.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

output "subnet_id" {
  value = yandex_vpc_subnet.vm-subnet.id
}
