## Summary
This terraform module uses both UniFI, Proxmox, and Namecheap. The VM will be created on the node specified, add the VM to UniFI as a client (with a static IP), add an A record pointing to the public IP specified, and will add a list of port forwarding rules to the UniFi firewall.

__NOTE:__ I have opted for a funky system of setting IPs. I have a preference for VM IDs to be part of the IP. For example a VM with an ID of 200 in a network like 192.168.0.0/24, will have an IP of 192.168.0.200. This limits the number of VMs available to 254, as the VM ID takes the last octet.

---
## Outputs
The following will be output by this module:  
``` json
{
  "ansible_host": {
    "sensitive": false,
    "type": [
      "object",
      {
        "domain": "string",
        "hostname": "string",
        "ip": "string",
        "mac": "string",
        "nameserver": "string",
        "tags": [
          "list",
          [
            "object",
            {
              "key": "string",
              "value": "string"
            }
          ]
        ]
      }
    ],
    "value": {
      "domain": "infra.lan",
      "hostname": "murmur",
      "ip": "192.168.0.208",
      "mac": "72:9D:A5:13:39:47",
      "nameserver": "192.168.0.2 192.168.0.3",
      "tags": [
        {
          "key": "role",
          "value": "Mumble"
        },
        {
          "key": "timezone",
          "value": "America/Alaska"
        }
      ]
    }
  }
}
```

---
## Providers/Versions
``` terraform
terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = ">=2.7.4"
    }
    unifi = {
      source = "paultyng/unifi"
      version = ">=0.30.1"
    }
  }
}
```

----
## Variables
### Namecheap
#### Summary

#### Objects
__Namecheap Object:__  
This object is only used for authentication with the exception of the sandbox option.
``` terraform
variable "namecheap" {
  type = object({
    user      = string
    api-user  = string
    api-key   = string
    client-ip = string
    domain    = string
    sandbox   = bool
  })
}
```

### UniFi
#### Summary

#### Objects
__UniFi Object:__  

The unifi object in variables is solely used to provide authenticaiton for the UniFi provider. There is no default, so the entier object must be provided.
``` terraform
variable "unifi" {
  type = object({
    user = string
    pass = string
    url  = string
  })
}
```

#### Basic Variables
| Key | Type | Required | Default | Description |
|  -  |   -   |     -    |    -    |      -     |
| unifi_site | string | N | "Default" | The site a rule should apply to |
| enabled | bool | N | true | To enable port forward rule or not |
| unifi-note | string | N | "A VM made by terragrunt" | A note in the unifi UI for a client. |

### Proxmox
#### Summary
#### Objects
__Proxmox Object:__  

The proxmox object in variables is solely used to provide authenticaiton for the proxmox provider. There is no default, so the entire object must be provided.  
``` terraform
variable "proxmox" {
  type = object({
    user = string
    pass = string
    url  = string
  })
}
```

__Cloud-Init Object:__  

This is used to provide your cloud-init derived VM with a user to create. The ssh keys can be provided as a multine line list. For example, a yaml file would look like so:  
``` yaml
cloud_init:
    user: test_user
    pass: Password1!
    ssh_keys: |
        ssh-rsa AAAABdzfghbdfgnbfncghmghmgmgh>
```

``` terraform
variable "cloud_init" {
  type = object({
      user     = string
      pass     = string
      ssh_keys = string
  })
}
```

#### Basic Variables
| Key | Type | Required | Default | Description |
|  -  |   -   |     -    |    -    |      -     |
| node | string | Y | N/A | The node to add the VM to |
| template-name | string | N | "CentOS-Stream-Template" | The template the VM will be made from |
| vm-name | string | Y | N/A | The name you will see in the Proxmox and UniFi UI |
| vm-id | number | Y | N/A | The VM ID in the Proxmox UI |
| desc | string | N | "Default description as created by terragrunt and terraform." | The decritpion for the VM (supports markdown) |
| tags | string | Y | N/A | Tag in Proxmox to apply |
| mem | number | N | 2048 | The total memory (in MB) to give the VM |
| cpu | number | N | 4 | The number of vCPUs to give the VM |
| disk0-size | string | N | "100G" | The disk size to give the VM (a string not int) |
| disk0-type | string | N | "scsi" | The disk connection type |
| disk0-storage | string | N | "local-zfs" | Proxmox storage array to use |
| disk0-backup | number | N | 1 | A bollean to decide if the disk should be backed up (1 is true) |
| disk0-replicate | number | N | 1 | A bollean to decide if the disk should be added to replication jobs (1 is true) |
| gateway | string | Y | N/A | The gateway for the VMs network |
| network | string | Y | N/A | The gateway for the VMs network |
| network_subnet | string | Y | N/A | The first three octets of the network (i.e. 10.0.0 or 192.168.0) |
| nameservers | string | N | "10.0.0.2, 10.0.0.3" | Nameservers to set for VMs |
| searchdomain | string | N | "infra.lan" | Search domain to set for VMs |
| net0-model | string | N | "virtio" | The device model to use |
| net0-bridge | string | N | "vmbr0" | The bridge name to attach the net device to |
| net0-tag | string | N | "-1" | The VLAN tag to use |
| net0-firewall | string | N | false | To enable proxmox firewall or not |
| net0-link-down | bool | N | false | To enable or disable the network device |
