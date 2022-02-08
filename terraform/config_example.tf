variable "vm_config" {
    description = "Configuration for the VM"
    type = map
    default = {
        count         = 1
        name          = "vm-name"
        #vmid         = 200 - If not set, it'll take the next free id counting from 100
        target_node   = "proxmox"
        template      = "template-debian"
        bios          = "ovmf" # UEFI requires ovmf
        os_type       = "cloud-init"
        cores         = 4
        cpu_type      = "host" # Unable to use KVM when using UEFI+Secureboot
        memory_limit  = "4096"
        balloon       = "1024"
        scsihw        = "virtio-scsi-pci" 
        bootdisk      = "scsi0"
        disk_slot     = 0
        disk_size     = "30G"
        disk_type     = "scsi"
        disk_storage  = "local-lvm"
        disk_iothread = 1
        net_model     = "virtio"
        net_bridge    = "vmbr0"
        ip            = "ip=0.0.0.0/24,gw=0.0.0.0"
        ciuser        = "ssh-user"
        ssh_pub       = "ssh-ed25519 ....." # Replace with your public SSH key for the ssh-user
    }
}