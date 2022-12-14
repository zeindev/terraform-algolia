# product indices for en-us

resource "algolia_index" "primary-en-us" {
  name = "${var.environment}-products-${var.locale.en-us}"
  attributes_config {
    searchable_attributes = var.searchable_attributes
    attributes_for_faceting = var.attributes_for_faceting
  }

  ranking_config {
    ranking = [
      "words",
      "proximity"
    ]
  }

  faceting_config {
    max_values_per_facet = 50
    sort_facet_values_by = "alpha"
  }

  languages_config {
    remove_stop_words_for = ["en"]
  }
}

resource "algolia_index" "replica-en-us-latest" {
  name = "${var.environment}-products-${var.locale.en-us}-${var.replica.latest}"
  primary_index_name = algolia_index.primary-en-us.name
}

resource "algolia_index" "replica-en-us-priceAsc" {
  name = "${var.environment}-products-${var.locale.en-us}-${var.replica.priceAsc}"
  primary_index_name = algolia_index.primary-en-us.name
}

resource "algolia_index" "replica-en-us-priceDesc" {
  name = "${var.environment}-products-${var.locale.en-us}-${var.replica.priceDesc}"
  primary_index_name = algolia_index.primary-en-us.name
}

resource "algolia_index" "replica-en-us-relevance" {
  name = "${var.environment}-products-${var.locale.en-us}-${var.replica.relevance}"
  primary_index_name = algolia_index.primary-en-us.name
}

resource "algolia_index" "replica-en-us-featured" {
  name = "${var.environment}-products-${var.locale.en-us}-${var.replica.featured}"
  primary_index_name = algolia_index.primary-en-us.name
}