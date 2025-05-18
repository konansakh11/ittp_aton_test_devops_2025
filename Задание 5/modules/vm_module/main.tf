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

data "yandex_compute_image" "os_image" {
  family = "ubuntu-2204-lts"
}

resource "yandex_compute_instance" "default" {
  name        = "first-instance"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.os_image.id
    }
  }

  secondary_disk {
    disk_id = var.disk_id
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }
}

variable "subnet_id" {
  type = string
}

variable "disk_id" {
  type = string
}
