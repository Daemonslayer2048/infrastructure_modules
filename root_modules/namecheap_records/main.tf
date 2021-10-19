resource "namecheap_domain_records" "Namecheap_Record" {
  domain = var.namecheap.domain
  mode = "MERGE"

  record {
    hostname = var.vm-name
    type = "A"
    address = var.namecheap.client-ip
  }
}
