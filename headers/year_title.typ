// Affiche le titre à gauche et l'académique à droite
#let year_title(
  document_config: (),
  print_config: (),
  campus_config: (),
) = [
  #document_config.doc_title
  #h(1fr)
  Année académique #text(document_config.year, fill: campus_config.style.primary_color)
]

