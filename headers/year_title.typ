// Affiche le titre à gauche et l'académique à droite
#let year_title(
  document_config: (),
  print_config: (),
  campus_config: (),
  title_left: true
) = {
  let year_content = [
    Année académique #text(document_config.year, fill: campus_config.style.primary_color)
  ]
  let title_content = [
    #document_config.doc_title
  ]

  let lhs = if title_left { title_content } else { year_content }
  let rhs = if title_left { year_content } else { title_content }


  lhs
  h(1fr)
  rhs
}

