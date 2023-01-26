variable "site_name" {
  type        = string
  description = "Site Name onboarded to cloudflare"
  default     = "djpai.dev"
}
variable "applications" {
  type        = set(string)
  description = "Application prefixes"
  default     = ["homer"]
}
variable "email_forwarders" {
  type        = map(string)
  description = "Key will be the prefix for the <email>@zone, value will be the forwarded address"
  default     = {}
}