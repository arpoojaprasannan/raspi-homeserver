resource "cloudflare_email_routing_settings" "djpai-dev" {
  zone_id = local.zone_id
  enabled = "true"
}

resource "cloudflare_email_routing_catch_all" "djpai-dev" {
  zone_id = local.zone_id
  name    = "CatchAll"
  enabled = true
  matcher {
    type = "all"
  }
  action {
    type  = "forward"
    value = ["dhananjaimvpai@gmail.com"]
  }
}

/* resource "cloudflare_email_routing_rule" "rules" {
  for_each = var.email_forwarders
  zone_id = local.zone_id
  name    = "ForwardRule ${each.key}"
  enabled = true

  matcher {
    type  = "literal"
    field = "to"
    value = "${each.key}@${local.zone}"
  }

  action {
    type  = "forward"
    value = [each.value]
  }
} */