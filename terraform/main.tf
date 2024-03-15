resource "yandex_vpc" "my_vpc" {
  name        = "my-vpc"
  folder_id   = var.yandex_folder_id
  description = "Empty VPC"

  subnet {
    name           = "public"
    zone           = "ru-central1-a" # зона для публичной подсети
    v4_cidr_blocks = ["192.168.10.0/24"]
  }

  subnet {
    name           = "private"
    zone           = "ru-central1-a" # зона для приватной подсети
    v4_cidr_blocks = ["192.168.20.0/24"]
  }
}

resource "yandex_compute_instance" "nat_instance" {
  name         = "nat-instance"
  zone         = "ru-central1-a" # зона для NAT-инстанса
  platform_id  = "standard-v1"
  image_id     = "fd8h0tfeml79jtu3rq82"
  subnet_id    = yandex_vpc.my_vpc.subnet["public"].id
  v4_address   = "192.168.10.254"
}

resource "yandex_compute_instance" "public_instance" {
  name         = "public-instance"
  zone         = "ru-central1-a" # зона для публичной виртуалки
  platform_id  = "standard-v1"
  subnet_id    = yandex_vpc.my_vpc.subnet["public"].id
}

resource "yandex_compute_instance" "private_instance" {
  name         = "private-instance"
  zone         = "ru-central1-a" # зона для приватной виртуалки
  platform_id  = "standard-v1"
  subnet_id    = yandex_vpc.my_vpc.subnet["private"].id
}

resource "yandex_vpc_route_table" "my_route_table" {
  vpc_id = yandex_vpc.my_vpc.id

  route {
    dest_range = "0.0.0.0/0"
    next_hop_instance = yandex_compute_instance.nat_instance.id
  }
}