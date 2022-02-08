variable "api" {
  type = map
  default = {
    pm_api_url = "https://proxmox.host:8006/api2/json"
    pm_api_token_id = "user@pam!user_proxmox"
    pm_api_token_secret = "token_secret"
  }
}