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
  monochrome: false,
  monochromeimages: true,

  font: "Open Sans",

  doc
) = {
  let decorations_color = rgb("#2F5496")

  set page("a4")
  set heading(numbering: "1.")
  set text(font: (font))

  set document(title: document_description)

  let campus_config = campus_configurations.at(campus)

  if monochrome {
    campus_config.primary_color = rgb("#333333")
    campus_config.onprimary_color = rgb("#FFFFFF")
    campus_config.full_logo_path = "/assets/logos/mono-logo-full.svg"
    campus_config.address_icon_path = "/assets/icons/mono-address.svg"
    campus_config.phone_icon_path = "/assets/icons/mono-phone.svg"
    campus_config.mail_icon_path = "/assets/icons/mono-mail.svg"
  }
  
  show image: it => {
    if monochromeimages and monochrome and type(it.source) == str {
      import "@preview/grayness:0.5.0" : plg
      let source = read(it.source, encoding: none)

      let graybytes = if it.source.ends-with("svg") {
        plg.svg_grayscale(source)
      } else {
        plg.grayscale(source)
      }

      image(
        graybytes,
        alt: it.alt,
        width: it.width,
        height: it.height,
        page: it.page,
        fit: it.fit,
        scaling: it.scaling,
        icc: it.icc
      )
    } else {
      it
    }
  }

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
  
    show heading: set text(weight: "medium") if not monochrome
    show heading.where(level: 1): set text(fill: decorations_color) if not monochrome
    show heading.where(level: 2): set text(fill: decorations_color.lighten(5%)) if not monochrome
    show heading.where(level: 3): set text(fill: decorations_color.lighten(10%)) if not monochrome

    show link: set text(fill: decorations_color.lighten(15%)) if not monochrome
    show link: it => if monochrome { underline(it) } else { it }
  doc
}
