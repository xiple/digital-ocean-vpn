output "ipv4_address" {
  value = digitalocean_droplet.vpn.ipv4_address
  description = "The ipv4 address of the droplet"
}
