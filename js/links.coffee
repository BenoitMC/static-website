$ ->
  # Open all external links in a new page
  $("a[*='://']").map ->
    this.target = "_blank"
