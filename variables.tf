variable "app_id_github_id" {
  description = "github id for app-id"
  sensitive   = true
  type        = string
}
variable "app_id_github_secret" {
  description = "github secret for app-id"
  sensitive   = true
  type        = string
}
variable "app_id_secret" {
  description = "secret for app-id"
  sensitive   = true
  type        = string
}
variable "ghcr_token" {
  description = "ghcr auth token"
  sensitive   = true
  type        = string
}
