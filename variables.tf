locals {
  locales = [
    "de",
    "en-eu",
    "en-gb",
    "en-us",
    "nl",
    "nl-be"
  ]
  replicas = [
    "latest",
    "priceAsc",
    "priceDesc",
    "featured",
    "relevance",
  ]
  replica_sort = {
    latest: "desc(publishDate)",
    priceAsc: "asc(prices.value.centAmount)",
    priceDesc: "desc(prices.value.centAmount)",
    featured: "desc(featured)",
    relevance: "desc(publishDate)",
  }

  # Nested loop over locale and replica lists, and flatten the result.
  product_suffixes = distinct(flatten([
    for locale in local.locales : [
      for replica in local.replicas : {
        locale = locale
        replica = replica
      }
    ]
  ]))
}

variable "searchable_attributes" {
  type    = list(string)
  default = [
    "sku",
    "shortDescription"
  ]
}

variable "attributes_for_faceting" {
  type    = list(string)
  default = [
      "productType"
    ]
}

# specify values for the following variables in a tfvars file and pass it to Terraform CLI. Ex: terraform plan -var-file="dev.tfvars"
variable environment {
  type = string
}

variable app_id {
  type = string
}

variable api_key {
  type = string
}