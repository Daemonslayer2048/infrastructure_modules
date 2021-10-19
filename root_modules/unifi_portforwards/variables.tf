variable "unifi" {
  type = object({
    user = string
    pass = string
    url  = string
  })
}

variable "fixed_ip" {
  description = "The static IP to assign to the VM."
  type        = string
}

variable "port_forwards" {
  type = list(object({
      name     = string
      dst_port = string
      fwd_port = string
      protocol = string
      enabled  = bool
      log      = bool
  }))
}
