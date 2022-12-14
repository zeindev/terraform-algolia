resource "algolia_index" "blog-primaries" {
  for_each      = toset(local.locales)

  name = "${var.environment}-blog-posts-${each.key}"

  attributes_config {
    searchable_attributes   = var.blog_searchable_attributes
    attributes_for_faceting = var.blog_attributes_for_faceting
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