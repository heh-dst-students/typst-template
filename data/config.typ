#let default_document_config(
  doc_title: "Titre",
  doc_description: "Description",
  formation_name: "Nom de la formation",
  orientation_name: "Orientation",
  year: "2025 - 2026",
  authors: (
    ("Prenom Nom", "prenom.nom@std.heh.be"),
    ("Xy Z", "xy.z@std.heh.be"),
  ),
  exam_session: "Juin 2026",
  internal_promoter: "NOM PRÉNOM"
) = {
  return (
    doc_title: doc_title,
    doc_description: doc_description,
    formation_name: formation_name,
    orientation_name: orientation_name,
    year: year,
    authors: authors,
    exam_session: exam_session,
    internal_promoter: internal_promoter
  )
}

#let outlines = (
  headings: (target: heading, title: "Table des matières"),
  tables: (target: figure.where(kind: table), title: "Table des tableaux"),
  images: (target: figure.where(kind: image), title: "Table des images"),
)

#let default_outlines_values = (
  outlines.headings,
  outlines.tables,
  outlines.images,
)

#let default_print_config(
  monochrome: false,
  monochromeimages: true,
  outlines: default_outlines_values,
  show_blank_page: false,
  font: "Roboto",
  lang: "fr",
) = {
  return (
    monochrome: monochrome,
    monochromeimages: monochromeimages,
    outlines: outlines,
    font: font,
    lang: lang,
    show_blank_page: show_blank_page,
  )
}

