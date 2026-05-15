#let heh_headings_defaults(document_config, print_config, campus_config, doc) = {
  let decorations_color = campus_config.style.decorations_color
  
  show heading: set text(weight: "medium") if not print_config.monochrome
  show heading.where(level: 1): set text(
    fill: decorations_color,
  ) if not print_config.monochrome
  show heading.where(level: 2): set text(
    fill: decorations_color.lighten(5%),
  ) if not print_config.monochrome
  show heading.where(level: 3): set text(
    fill: decorations_color.lighten(10%),
  ) if not print_config.monochrome

  set par(spacing: 2em, leading: 0.8em)
  show heading: set text(top-edge: 1.6em, bottom-edge: "descender")

  doc
}
#let heh_links_defaults(document_config, print_config, campus_config, doc) = {
  let decorations_color = campus_config.style.decorations_color

  show link: set text(
    fill: decorations_color.lighten(15%),
  ) if not print_config.monochrome
  show link: it => if print_config.monochrome { underline(it) } else { it }
  
  doc
}

#let heh_raw_defaults(print_config, doc) = {
  set raw(theme: none) if print_config.monochrome

  doc
}

