# https://registry.terraform.io/providers/k-yomo/algolia/0.5.6

terraform {
  required_providers {
    algolia = {
      source = "k-yomo/algolia"
      version = "0.5.6"
    }
  }
}

provider "algolia" {
  # Configuration options
  # app_id should come from environment variable ALGOLIA_APP_ID
  # api_key should come from environment variable ALGOLIA_API_KEY
}