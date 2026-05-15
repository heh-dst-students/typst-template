#import "/utils/states.typ": heh_config

// Affiche le titre à gauche et l'académique à droite
#let year_title(
  title_left: true,
) = context {
  let config = heh_config.get()
  let year_content = [
    Année académique #text(config.document.year, fill: config.campus.style.primary_color)
  ]
  let title_content = config.document.doc_title

  let lhs = if title_left { title_content } else { year_content }
  let rhs = if title_left { year_content } else { title_content }

  lhs
  h(1fr)
  rhs
}

