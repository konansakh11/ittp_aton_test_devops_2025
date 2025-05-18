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

module "yandex_compute_disk" {
  source = "./modules/disk_module"
}

module "yandex_vpc_network" {
  source = "./modules/network_module"
}

module "yandex_compute_instance" {
  source = "./modules/vm_module"
  subnet_id  = module.yandex_vpc_network.subnet_id
  disk_id = module.yandex_compute_disk.disk_id
}
