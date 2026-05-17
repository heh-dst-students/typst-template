#import "/utils/utils.typ": heh_logo
#import "/utils/states.typ": heh_config

// Affiche le logo à gauche et l'année académique et le titre à droite
#let logo_year_title(
  show_year: true,
  show_title: true,
) = context {
  let config = heh_config.get()
  columns(2, {
    heh_logo(
      width: 200pt,
    )

    colbreak()
    align(right, {
      if show_year [
        Année académique #text(config.document.year, fill: config.campus.style.primary_color)
      ]
      if show_year and show_title {
        linebreak()
      }
      if show_title {
        config.document.doc_title
      }
    })
  })
}

