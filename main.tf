# https://registry.terraform.io/providers/k-yomo/algolia/0.5.6

terraform {
  required_providers {
    algolia = {
      source  = "k-yomo/algolia"
      version = "0.5.6"
    }
  }
}

provider "algolia" {
  app_id  = var.app_id
  api_key = var.api_key
}