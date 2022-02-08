provider "proxmox" {
  pm_api_url = var.api["pm_api_url"]
  pm_api_token_id = var.api["pm_api_token_id"]
  pm_api_token_secret = var.api["pm_api_token_secret"]
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "seedbox" { # Replace seedbox with whatever you prefer, does not matter.

  count = var.vm_config["count"]
  name = "tf-${var.vm_config["name"]}"
  vmid = var.vm_config["vmid"]
  target_node = var.vm_config["target_node"]
  clone = var.vm_config["template"]
  agent = 1
  bios = var.vm_config["bios"]
  os_type = var.vm_config["os_type"]
  cores = var.vm_config["cores"]
  sockets = 1
  cpu = var.vm_config["cpu_type"]
  memory = var.vm_config["memory_limit"]
  balloon = var.vm_config["balloon"]
  scsihw = var.vm_config["scsihw"]
  bootdisk = var.vm_config["bootdisk"]

  disk {
    slot = 0
    size = var.vm_config["disk_size"]
    type = var.vm_config["disk_type"]
    storage = var.vm_config["disk_storage"]
    iothread = var.vm_config["disk_iothread"]
  }
  
  network {
    model = var.vm_config["net_model"]
    bridge = var.vm_config["net_bridge"]
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }
  
  ipconfig0 = var.vm_config["ip"]
  
  ciuser = var.vm_config["ciuser"]
  sshkeys = <<EOF
  ${var.vm_config["ssh_pub"]}
  EOF

}