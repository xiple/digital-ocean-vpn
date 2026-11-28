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

data "digitalocean_vpc" "default" {
  region = var.region
}

resource "digitalocean_droplet" "vpn" {
  image   = var.droplet_image
  name    = var.dropblet_name
  region  = var.region
  size    = var.dropblet_size
  vpc_uuid = data.digitalocean_vpc.default.id
  ssh_keys = [data.digitalocean_ssh_key.wireguard.id]
  tags = ["vpn"]
}
