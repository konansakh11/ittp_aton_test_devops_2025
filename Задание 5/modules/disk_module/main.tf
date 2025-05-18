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

resource "yandex_compute_disk" "secondary_disk" {
  name     = "secondary-disk"
  type     = "network-hdd"
  zone     = "ru-central1-a"
  size     = 10
}

output "disk_id" {
  value = yandex_compute_disk.secondary_disk.id
}
