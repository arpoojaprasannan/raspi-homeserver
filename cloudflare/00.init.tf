terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

# Add Site to Cloudflare
# Add NS Records to Google Domains
# Create API Token and export as CLOUDFLARE_API_TOKEN

data "cloudflare_accounts" "this" {}
data "cloudflare_zone" "this" {
  name = local.zone
}

locals {
  account_id = data.cloudflare_accounts.this.accounts[0].id
  zone       = var.site_name
  zone_id    = data.cloudflare_zone.this.id
}
