variable "dropblet_name" {
  description = "Droplet name"
  type = string
  default = "vpn-01"
}

variable "dropblet_size" {
  description = "Droplet size slug"
  type = string
  default = "s-1vcpu-1gb"
}

variable "droplet_image" {
  description = "Droplet image slug"
  type = string
  default = "ubuntu-26-04-x64"
}

variable "region" {
  description = "Region for ressource creation"
  type = string
  default = "fra1"
}

variable "vpc_ip_range" {
  description = "VPC CIDR range"
  type = string
  default = "10.0.0.0/24"
}