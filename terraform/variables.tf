variable "yandex_token" {
  default = var.token
}

variable "yandex_cloud_id" {
  default = var.cloud_id
}

variable "yandex_folder_id" {
  default = "b1gb5mplcv6bu0g0eolj"
}

variable "a-zone" {
  default = "ru-central1-a"
}

variable "nat-instance-image-id" {
  default = "fd80mrhj8fl2oe87o4e1"
}

variable "nat-instance-ip" {
  default = "192.168.10.254"
}

variable "Ubuntu-2204-LTS" {
  default = "fd85u0rct32prepgjlv0"
}

variable "nat-instance-name" {
  default = "nat-instance-vm1"
}

variable "public-vm-name" {
  default = "public-vm1"
}

variable "private-vm-name" {
  default = "private-vm1"
}