resource "unifi_port_forward" "UniFi_Port_Forward" {
  for_each = {for rule in var.port_forwards:  rule.name => rule}
  name     = each.value.name
  dst_port = each.value.dst_port
  fwd_ip   = var.fixed_ip
  fwd_port = each.value.fwd_port
  protocol = each.value.protocol
  log      = each.value.log
  enabled  = each.value.enabled
}
