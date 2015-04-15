$ ->
  # Open all external links in a new page
  $("a[href*='://']").map ->
    this.target = "_blank"
