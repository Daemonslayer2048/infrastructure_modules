resource "unifi_user" "UniFi_User" {
  mac        = var.mac
  name       = var.name
  note       = var.unifi-note
  fixed_ip   = var.fixed_ip
  network_id = "${data.unifi_network.lan_network.id}"
}
