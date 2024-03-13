provider "yandex" {
  token     = "AQAAAAAIkgGxAATuwW6RRMSneE2uuV6vpMTK0Jw"
  cloud_id  = "b1ghns2saijtpp8com7i"
  folder_id = "b1gb5mplcv6bu0g0eolj"
  zone      = "ru-central1-a" # Выберите нужную зону
}

resource "yandex_vpc" "my_vpc" {
  name        = "my-vpc"
  folder_id   = var.yandex_folder_id
  description = "Empty VPC"

  subnet {
    name           = "subnet-1"
    zone           = "ru-central1-a" # Выберите зону для подсети
    v4_cidr_blocks = ["10.0.1.0/24"]
  }
}
