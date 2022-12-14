# product indices for en-us

resource "algolia_index" "primaries" {
  for_each      = toset(local.locales)

  name = "${var.environment}-products-${each.key}"

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

resource "algolia_index" "replicas" {
  depends_on = [algolia_index.primaries]
  for_each   = { for entry in local.product_suffixes: "${entry.locale}.${entry.replica}" => entry }

  name = "${var.environment}-products-${each.value.locale}-${each.value.replica}"
  primary_index_name = "${var.environment}-products-${each.value.locale}"
  ranking_config {
    custom_ranking = [lookup(local.replica_sort, each.value.replica, "")]
  }
}

resource "algolia_index" "query_suggestions" {
  depends_on = [algolia_index.primaries]
  for_each   = toset(local.locales)

  name = "${var.environment}-products-${each.key}_query_suggestions"
}

resource "algolia_query_suggestions" "query_suggestions" {
  depends_on = [algolia_index.query_suggestions]
  for_each   = toset(local.locales)

  index_name = "${var.environment}-products-${each.key}_query_suggestions"

  source_indices {
    index_name  = "${var.environment}-products-${each.key}"
    min_hits    = 10
    min_letters = 3
    generate    = [["name"], ["name", "productType"]]
  }

  // languages = ["en", "ja"]
}