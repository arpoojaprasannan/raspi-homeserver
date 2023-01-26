# Access application to apply zero trust policy over SSH endpoint
resource "cloudflare_access_application" "app" {
  for_each = var.applications

  zone_id          = local.zone_id
  name             = "${each.value}.${local.zone}"
  domain           = "${each.value}.${local.zone}"
  session_duration = "72h"
}

resource "cloudflare_access_policy" "user_email" {
  for_each = var.applications

  application_id = cloudflare_access_application.app[each.value].id
  zone_id        = local.zone_id
  name           = "${each.value}.${local.zone}"
  precedence     = "1"
  decision       = "allow"

  include {
    email_domain = [local.zone]
  }
}