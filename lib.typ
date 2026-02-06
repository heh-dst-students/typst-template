#import "pages/cover.typ" : heh_cover_page
#import "data.typ" : campus_configurations

#let heh_template(
  campus: "DST",
  document_title: "Titre",
  document_description: "Description",
  formation_name: "Bachelier en Informatique",
  orientation_name: "Orientation Développement",
  authors_names_mails: (
    ("Prenom Nom", "prenom.nom@std.heh.be"),
    ("Xy Z", "xy.z@std.heh.be"),
  ),
  year: "2025 - 2026",

  doc
) = {
  set page("a4")
  set heading(numbering: "1.")

  set document(title: document_description)

  let campus_config = campus_configurations.at(campus)

  heh_cover_page(
    campus_config: campus_config,
    document_title: document_title,
    document_description: document_description,
    formation_name: formation_name,
    orientation_name: orientation_name,
    authors_names_mails: authors_names_mails,
    year: year
  )

  pagebreak()

  doc
}
