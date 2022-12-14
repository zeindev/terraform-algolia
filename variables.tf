variable "locale" {
  type = object({
    en-us = string
    en-gb = string
    nl = string
    nl-be = string
    de = string
    en-eu = string
  })
  default = {
      en-us = "en-us"
      en-gb = "en-gb"
      nl = "nl"
      nl-be = "nl-be"
      de = "de"
      en-eu = "en-eu"
    }
  
}

variable "replica" {
  type = object({
    latest = string
    priceAsc = string
    priceDesc = string
    featured = string
    relevance = string
  })
  default = {
      latest = "latest"
      priceAsc = "priceAsc"
      priceDesc = "priceDesc"
      featured = "featured"
      relevance = "relevance"
    }
  
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