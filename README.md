# proxmox-terraform-ansible
I'll update this as the project moves forward.

## Terraform
### / Purpose
Create virtual machines in Proxmox with supplied configuration, hand over the VM to Ansible to setup applications/services and to maintain configuration/updates. - *Something like that.*

### / File structure
* **api_example.tf** - Variables for Proxmox API authentication.
* **config_example.tf** - Variables for TF/VM.
* **main.tf** - Creates the resource specified.

### / Todo
- [ ] Create an inventory for Ansible to manage
- [ ] Verify relevant configuration is dynamic
- [ ] Clean up, make sure it's dynamic enough