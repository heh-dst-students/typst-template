#import "/utils/vsvg.typ" : vsvg_heh

// Affiche le logo à gauche et l'année académique et le titre à droite
#let logo_title(
  document_config: (),
  print_config: (),
  campus_config: (),
  ..args
) = {
  columns(2)[
    #vsvg_heh(
      source: "/assets/logos/heh-logo.vsvg",
      campus_config: campus_config,
      width: 200pt,
    )

    #colbreak()
    #align(right)[
      Année académique #text(document_config.year, fill: campus_config.style.primary_color) \
      #document_config.doc_title
    ]
  ]
}

