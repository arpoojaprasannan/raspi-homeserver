resource "random_id" "tunnel_secret" {
  byte_length = 35
}

resource "cloudflare_argo_tunnel" "tunnel" {
  account_id = local.account_id
  name       = "raspi-tunnel"
  secret     = local.tunnel_secret
}

resource "cloudflare_record" "cloudflare_tunnel" {
  for_each = var.applications

  zone_id = local.zone_id
  name    = "${each.value}.${local.zone}"
  value   = "${local.tunnel_id}.cfargotunnel.com"
  type    = "CNAME"
  proxied = true
}

resource "local_file" "creds-json" {
  content = jsonencode({
    AccountTag   = local.account_id
    TunnelID     = local.tunnel_id
    TunnelName   = local.tunnel_name
    TunnelSecret = local.tunnel_secret
  })
  filename = "./creds.json"
}

locals {
  tunnel_id     = cloudflare_argo_tunnel.tunnel.id
  tunnel_name   = cloudflare_argo_tunnel.tunnel.name
  tunnel_secret = random_id.tunnel_secret.b64_std
  tunnel_token  = cloudflare_argo_tunnel.tunnel.tunnel_token
}
