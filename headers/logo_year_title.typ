#import "/utils/utils.typ": heh_logo

// Affiche le logo à gauche et l'année académique et le titre à droite
#let logo_year_title(
  document_config: (),
  print_config: (),
  campus_config: (),
  show_year: true,
  show_title: true,
) = {
  columns(2, {
    heh_logo(
      campus_config,
      width: 200pt,
    )

    colbreak()
    align(right, {
      if show_year [
        Année académique #text(document_config.year, fill: campus_config.style.primary_color)
      ]
      if show_year and show_title {
        linebreak()
      }
      if show_title {
        document_config.doc_title
      }
    })
  })
}

