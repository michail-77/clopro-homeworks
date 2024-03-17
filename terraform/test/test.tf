terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  token     = "AQAAAAAIkgGxAATuwW6RRMSneE2uuV6vpMTK0Jw" # *OAuth-токен яндекса*
	# не обязательный параметр (берется облако по умолчанию),
	# хотя в документации написано иначе
  cloud_id  = "b1ghns2saijtpp8com7i"
  folder_id = "b1gb5mplcv6bu0g0eolj"
  zone      = "ru-central1-a"
}

# ресурс "yandex_compute_instance" т.е. сервер
# Terraform будет знаеть его по имени "yandex_compute_instance.default"
resource "yandex_compute_instance" "default" { 
  name = "test-instance"
	platform_id = "standard-v1" # тип процессора (Intel Broadwell)

  resources {
    core_fraction = 5 # Гарантированная доля vCPU
    cores  = 2 # vCPU
    memory = 1 # RAM
  }

  boot_disk {
    initialize_params {
      image_id = "fd85u0rct32prepgjlv0" # ОС (Ubuntu, 22.04 LTS)
    }
  }

  network_interface {
    subnet_id = "e2lf943cj2gimcrfa3cm" # одна из дефолтных подсетей
    nat = true # автоматически установить динамический ip
  }
}
