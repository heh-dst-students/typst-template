#import "/utils/states.typ": heh_config

#let presentation_footer() = context {
  set text(size: 14pt)
  let config = heh_config.get()
  columns(3, {
    config.document.authors.map(a => a.at(0)).join(", ", last: " et ")
    colbreak()
    align(center, config.document.doc_title)
    // Affiche les numéros de page à droite
    colbreak()
    align(
      right,
      counter(page).display(
        "1/1",
        both: true,
      ),
    )
  })
}
