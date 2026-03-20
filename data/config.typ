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
) = {
  return (
    doc_title: doc_title,
    doc_description: doc_description,
    formation_name: formation_name,
    orientation_name: orientation_name,
    year: year,
    authors: authors,
  )
}

#let default_print_config(
  monochrome: false,
  monochromeimages: true,
  show_outline: true,
  font: "Roboto",
  lang: "fr",
) = {
  return (
    monochrome: monochrome,
    monochromeimages: monochromeimages,
    show_outline: show_outline,
    font: font,
    lang: lang,
  )
}

