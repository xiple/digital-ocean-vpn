terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {}

data "digitalocean_ssh_key" "wireguard" {
  name = "wireguard_do"
}

resource "digitalocean_vpc" "wireguard" {
  name = "wireguard-vpc"
  region = var.region
  description = "VPC for wireguard droplets"
  ip_range = var.vpc_ip_range
}

resource "digitalocean_droplet" "vpn" {
  image   = var.droplet_image
  name    = var.dropblet_name
  region  = var.region
  size    = var.dropblet_size
  vpc_uuid = digitalocean_vpc.wireguard.id
  ssh_keys = [data.digitalocean_ssh_key.wireguard.id]
  tags = ["vpn"]
}
